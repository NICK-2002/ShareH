import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/widget/textview.dart';

import '../controllers/video_history_controller.dart';

class VideoHistoryView extends GetView<VideoHistoryController> {
  const VideoHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoHistoryController>(
        init: VideoHistoryController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: Get.width,
                    height: Get.height * 0.6,
                    child: Image.asset(
                      "assets/history_empty_view/emptyVideoView.png",
                      fit: BoxFit.contain,
                    )),
                TextView(
                  text: "No Video(s) Received",
                  size: 21,
                  color: Color.fromARGB(255, 168, 167, 167),
                )
              ],
            )),
          );
        });
  }
}
