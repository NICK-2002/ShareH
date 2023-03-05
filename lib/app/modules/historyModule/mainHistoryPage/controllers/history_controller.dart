import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/modules/historyModule/audioHistory/views/audio_history_view.dart';
import 'package:share_h/app/modules/historyModule/filesHistory/views/files_history_view.dart';
import 'package:share_h/app/modules/historyModule/imagesHistory/views/images_history_view.dart';
import 'package:share_h/app/modules/historyModule/videoHistory/views/video_history_view.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
  final home_controller = Get.put(HomeController());
  String count = "";
  List<Widget> items = [
    ImagesHistoryView(),
    VideoHistoryView(),
    AudioHistoryView(),
    FilesHistoryView()
  ];
  int current = 0;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  audio_history() {
    current = 2;
    update();
  }

  video_history() {
    current = 1;
    update();
  }
  image_history() {
    current = 0;
    update();
  }
  file_history() {
    current = 3;
    update();
  }
}
