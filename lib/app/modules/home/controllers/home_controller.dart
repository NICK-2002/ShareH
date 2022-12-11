import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

import 'package:nearby_connections/nearby_connections.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<void> onInit() async {
    super.onInit();
    checkPermissions();
  }
  void ini() {
   Nearby().askExternalStoragePermission();
   Nearby().askLocationAndExternalStoragePermission();
   Nearby().askBluetoothPermission();
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

  
}
