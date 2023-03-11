import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:share_h/app/data/global.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';
import 'package:share_h/app/routes/app_pages.dart';

class SendReceivePageController extends GetxController {
  //TODO: Implement SendReceivePageController
  dynamic argumentData = Get.arguments;
  String pageName = "";
  final home_controller = Get.put(HomeController());
  final count = 0.obs;
  String? tempFileUri;
  RxDouble cPer = 0.0.obs;
  GlobalVar test = Get.find<GlobalVar>();
  final homeController = Get.find<HomeController>();
  @override
  void onInit() {
    super.onInit();
    cPer.value = homeController.c.value;
    pageName = argumentData[0];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void back() async {
    Get.offAllNamed(Routes.HOME);
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    // endpointMap.clear();
    // update();
  }

  Future<void> openImage(int img) async {
    PickedFile? data;
    if (img == 0) {
      //data = await ImagePicker().getImage(source: ImageSource.gallery);
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc'],
      );

      if (result != null) {
        Uint8List? fileBytes = result.files.first.bytes;
        String fileName = result.files.first.name;

        for (MapEntry<String, ConnectionInfo> m
            in home_controller.endpointMap.entries) {
          int payloadId =
              await Nearby().sendFilePayload(m.key, result.files[0].path!);
          home_controller.showSnackbar("Sending file to ${m.key}");
          Nearby().sendBytesPayload(
              m.key,
              Uint8List.fromList(
                  "$payloadId:${result.files[0].path!.split('/').last}"
                      .codeUnits));
        }
      }
    } else {
      data = await ImagePicker().getVideo(source: ImageSource.gallery);

      if (data == null) return;

      for (MapEntry<String, ConnectionInfo> m
          in home_controller.endpointMap.entries) {
        int payloadId = await Nearby().sendFilePayload(m.key, data.path);
        home_controller.showSnackbar("Sending file to ${m.key}");
        Nearby().sendBytesPayload(
            m.key,
            Uint8List.fromList(
                "$payloadId:${data.path.split('/').last}".codeUnits));
      }
    }
  }
}
