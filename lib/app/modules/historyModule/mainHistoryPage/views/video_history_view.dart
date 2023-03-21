import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/controllers/history_controller.dart';
import 'package:share_h/app/widget/textview.dart';

class VideoHistoryView extends GetView<HistoryController> {
  const VideoHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
        builder: (controller) {
          return Scaffold(
            body: controller.video.isEmpty
            ? Center(
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
            )):Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: controller.video.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = controller.video[index + 1];
                      // String? mimeStr = lookupMimeType(item);
                       var fileType = item!.split('/');

                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: FileImage(
                                      File(controller.videoThumbnailPath[index])),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }),
              ),
          );
        });
  }
}
