import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/data/fileTransfer_Database.dart';
import 'package:share_h/app/data/global.dart';
import 'package:share_h/app/model/fileDetails.dart';
import 'package:share_h/app/modules/historyModule/audioHistory/views/audio_history_view.dart';
import 'package:share_h/app/modules/historyModule/filesHistory/views/files_history_view.dart';
import 'package:share_h/app/modules/historyModule/imagesHistory/views/images_history_view.dart';
import 'package:share_h/app/modules/historyModule/videoHistory/views/video_history_view.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
  final home_controller = Get.put(HomeController());
  late List<FileDetails> user;
  Map<int, String> picture = {};
  Map<int, String> video = {};
  Map<int, String> audio = {};
  Map<int, String> files = {};
  int pictureIndex = 1;
  int videoIndex = 1;
  int audioIndex = 1;
  int filesIndex = 1;
  String count = "";
  var selectedTab = 0.obs;
  List<Widget> items = [
    ImagesHistoryView(),
    VideoHistoryView(),
    AudioHistoryView(),
    FilesHistoryView()
  ];
  int current = 0;
  @override
  void onInit() {
    currentTab = 0;
    user = <FileDetails>[];
    refreshNote();
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

  refreshNote() async {
    user = await FileTransferDatabase.instance.readAllNotes();
    for (var i = 0; i < user.length; i++) {
      String? mimeStr = user[i].location;
      var fileType = mimeStr.split('.');
      if (fileType[1] == "jpg" ||
          fileType[1] == "jpeg" ||
          fileType[1] == "png" ||
          fileType[1] == "heic") {
        picture[pictureIndex] = mimeStr;
        pictureIndex++;
      } else if (fileType[1] == "mp4" ||
          fileType[1] == "m4p" ||
          fileType[1] == "mpeg" ||
          fileType[1] == "gif" ||
          fileType[1] == "m4v" ||
          fileType[1] == "mpg") {
        video[videoIndex] = mimeStr;
        videoIndex++;
      } else if (fileType[1] == "mp3" ||
          fileType[1] == "aac" ||
          fileType[1] == "aa" ||
          fileType[1] == "ogg" ||
          fileType[1] == "mmf" ||
          fileType[1] == "wma" ||
          fileType[1] == "m4p") {
        audio[audioIndex] = mimeStr;
        audioIndex++;
      } else {
        files[filesIndex] = mimeStr;
        filesIndex++;
      }
    }
    print(user);
    print(picture);
    print(video);
    print(audio);

    print(files);
  }

  changeTab(choosenTab) {
    selectedTab.value = choosenTab;
    currentTab = choosenTab;
    load(choosenTab);
    update();
  }

  load(int index) {
    selectedTab.value = index;
  }

  // audio_history() {
  //   current = 2;
  //   update();
  // }

  // video_history() {
  //   current = 1;
  //   update();
  // }

  // image_history() {
  //   current = 0;
  //   update();
  // }

  // file_history() {
  //   current = 3;
  //   update();
  // }
}
