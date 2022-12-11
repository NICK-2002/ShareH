import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';

class ConnectionPageController extends GetxController {
  //TODO: Implement ConnectionPageController
  dynamic argumentData = Get.arguments;
  String pageName = "";

  String? tempFileUri; //reference to the file currently being transferred

  bool showImageButton = false;
  bool startDiscovering = false;

  @override
  void onInit() {
    super.onInit();
    pageName = argumentData[0];
    if (pageName == "Sender") {
      showImageButton = true;
    } else {
      startDiscovering = true;
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

  void back() async {
    Get.back();
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    // endpointMap.clear();
    // update();
  }

  void openImage() {}
}
