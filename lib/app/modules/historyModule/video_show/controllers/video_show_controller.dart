
import 'dart:io';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoShowController extends GetxController {
  //TODO: Implement VideoShowController
  late VideoPlayerController videoplay;
  var data = Get.arguments;

  @override
  void onInit() {
    videoplay = VideoPlayerController.file(File(data[0]))
      ..initialize().then((_) {
        update();
      });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoplay.dispose();
    super.onClose();
  }

  playStopVideo() {
    videoplay.value.isPlaying ? videoplay.pause() : videoplay.play();
    update();
  }
}
