import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/modules/connectionPage/controllers/connection_page_controller.dart';
import 'package:share_h/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final String userName = Random().nextInt(10000).toString();
  final Strategy strategy = Strategy.P2P_STAR;
  int Senderview = 0;
  Map<String, ConnectionInfo> endpointMap = Map();
  Map<int, String> map = Map();
  String? tempFileUri;
  bool hshowImageButton = false;
  double a = 0;
  double b = 0;
  double c = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    checkPermissions();
  }

  Future<void> ini() async {
    Nearby().askExternalStoragePermission();
    Nearby().askLocationAndExternalStoragePermission();
    var status = await Permission.manageExternalStorage.status;
   if (!status.isGranted) {
     await Permission.manageExternalStorage.request();
   }

  }

  void checkPermissions() async {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  pageSet(int value) {
    Senderview = value;
    update();
  }

  void change(double f) {
    b = f;
    c = (b / a) * 100;
    update();

    print(c);
  }

  Future<void> sender() async {
    try {
      bool a = await Nearby().startAdvertising(
        userName,
        strategy,
        onConnectionInitiated: onConnectionInit,
        onConnectionResult: (id, status) {
          showSnackbar(status);
        },
        onDisconnected: (id) {
          showSnackbar(
              "Disconnected: ${endpointMap[id]!.endpointName}, id $id");

          endpointMap.remove(id);
          update();
        },
      );
      showSnackbar("ADVERTISING: " + a.toString());
    } catch (exception) {
      showSnackbar(exception);
    }
  }

  Future<void> receiver() async {
    try {
      bool a = await Nearby().startDiscovery(
        userName,
        strategy,
        onEndpointFound: (id, name, serviceId) {
          // show sheet automatically to request connection

          showModalBottomSheet(
            context: Get.context!,
            builder: (builder) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text("id: " + id),
                    Text("Name: " + name),
                    Text("ServiceId: " + serviceId),
                    ElevatedButton(
                      child: Text("Request Connection"),
                      onPressed: () {
                        Navigator.pop(Get.context!);
                        Nearby().requestConnection(
                          userName,
                          id,
                          onConnectionInitiated: (id, info) {
                            onConnectionInit(id, info);
                          },
                          onConnectionResult: (id, status) {
                            showSnackbar(status);
                          },
                          onDisconnected: (id) {
                            endpointMap.remove(id);
                            update();
                            showSnackbar(
                                "Disconnected from: ${endpointMap[id]!.endpointName}, id $id");
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        onEndpointLost: (id) {
          showSnackbar(
              "Lost discovered Endpoint: ${endpointMap[id]!.endpointName}, id $id");
        },
      );
      showSnackbar("DISCOVERING: " + a.toString());
    } catch (e) {
      showSnackbar(e);
    }
  }

  void showSnackbar(dynamic a) {
    Get.snackbar("", a.toString());
  }

  void onConnectionInit(String id, ConnectionInfo info) {
    showModalBottomSheet(
      context: Get.context!,
      builder: (builder) {
        return Center(
          child: Column(
            children: <Widget>[
              Text("id: " + id),
              Text("Token: " + info.authenticationToken),
              Text("Name" + info.endpointName),
              Text("Incoming: " + info.isIncomingConnection.toString()),
              ElevatedButton(
                child: Text("Accept Connection"),
                onPressed: () {
                  Navigator.pop(Get.context!);
                  Senderview == 1
                      ? Get.toNamed(Routes.SEND_RECEIVE_PAGE,
                          arguments: ['Sender'])
                      : Get.toNamed(Routes.SEND_RECEIVE_PAGE,
                          arguments: ['Receiver']);
                  //imageButtonshow();
                  endpointMap[id] = info;
                  update();
                  Nearby().acceptConnection(
                    id,
                    onPayLoadRecieved: (endid, payload) async {
                      if (payload.type == PayloadType.BYTES) {
                        String str = String.fromCharCodes(payload.bytes!);
                        showSnackbar(endid + ": " + str);

                        if (str.contains(':')) {
                          // used for file payload as file payload is mapped as
                          // payloadId:filename
                          int payloadId = int.parse(str.split(':')[0]);
                          String fileName = (str.split(':')[1]);

                          if (map.containsKey(payloadId)) {
                            if (tempFileUri != null) {
                              moveFile(tempFileUri!, fileName);
                            } else {
                              showSnackbar("File doesn't exist");
                            }
                          } else {
                            //add to map if not already
                            map[payloadId] = fileName;
                          }
                        }
                      } else if (payload.type == PayloadType.FILE) {
                        showSnackbar(endid + ": File transfer started");
                        tempFileUri = payload.uri;
                      }
                    },
                    onPayloadTransferUpdate: (endid, payloadTransferUpdate) {
                      a = payloadTransferUpdate.totalBytes.toDouble();
                      if (payloadTransferUpdate.status ==
                          PayloadStatus.IN_PROGRESS) {
                        change(
                            payloadTransferUpdate.bytesTransferred.toDouble());
                        print(payloadTransferUpdate.bytesTransferred);
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.FAILURE) {
                        print("failed");
                        showSnackbar(endid + ": FAILED to transfer file");
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.SUCCESS) {
                        showSnackbar(
                            "$endid success, total bytes = ${payloadTransferUpdate.totalBytes}");

                        if (map.containsKey(payloadTransferUpdate.id)) {
                          //rename the file now
                          String name = map[payloadTransferUpdate.id]!;
                          moveFile(tempFileUri!, name);
                          print(name + "-------------------------");
                        } else {
                          //bytes not received till yet
                          map[payloadTransferUpdate.id] = "";
                        }
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                child: Text("Reject Connection"),
                onPressed: () async {
                  Navigator.pop(Get.context!);
                  try {
                    await Nearby().rejectConnection(id);
                  } catch (e) {
                    showSnackbar(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> moveFile(String uri, String fileName) async {
    // String parentDir = (await getExternalStorageDirectory())!.absolute.path;
    Directory? parentDir = (await getExternalStorageDirectory());
    String newPath = "";
    print(parentDir);
    List<String> paths = parentDir!.path.split("/");
    for (int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if (folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    newPath = newPath + "/ShareH";
    parentDir = Directory(newPath);
    if (!await parentDir.exists()) {
      await parentDir.create(recursive: true);
    }
    final b = await Nearby()
        .copyFileAndDeleteOriginal(uri, '${parentDir.path}/$fileName');

    showSnackbar("Moved file:" + b.toString());
  // Database:-
  //   final data = User(
  //      name: fileName,
  //      location: '${parentDir.path}/$fileName',
  //      createdTime: DateTime.now());
  //  await UserInfoBase.instance.insertInUserTable(data);
    return b;
  }

  imageButtonshow() {
    hshowImageButton = !hshowImageButton;
    update();
  }
}
