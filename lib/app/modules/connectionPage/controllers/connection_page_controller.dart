import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';

class ConnectionPageController extends GetxController {
  //TODO: Implement ConnectionPageController
  dynamic argumentData = Get.arguments;
  String pageName = "";//reference to the file currently being transferred

  bool showImageButton = false;
  bool startDiscovering = false;

  @override
  void onInit() {
    super.onInit();
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
    Get.back();
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    // endpointMap.clear();
    // update();
  }
}
