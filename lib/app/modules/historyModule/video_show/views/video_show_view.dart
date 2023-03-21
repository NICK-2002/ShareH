import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_show_controller.dart';

class VideoShowView extends GetView<VideoShowController> {
  const VideoShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoShowController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InteractiveViewer(
                panEnabled: true,
                boundaryMargin: EdgeInsets.zero,
                minScale: 1,
                maxScale: 2,
                child: Center(
                  child: controller.videoplay.value.isInitialized
                      ? GestureDetector(
                          onTap: () => controller.playStopVideo(),
                          child: VideoPlayer(controller.videoplay),
                        )
                      : Container(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 32,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.back(),
                ),
              )
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     controller.playStopVideo();
          //   },
          //   child: Icon(
          //     controller.videoplay.value.isPlaying
          //         ? Icons.pause
          //         : Icons.play_arrow,
          //   ),
          // ),
        ),
      );
    });
  }
}
