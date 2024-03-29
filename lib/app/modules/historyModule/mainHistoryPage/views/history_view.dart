import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/audio_history_view.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/files_history_view.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/images_history_view.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/video_history_view.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.16,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: <Color>[
                        Color.fromARGB(255, 77, 133, 230),
                        Color.fromARGB(255, 5, 79, 205)
                      ]),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextView(
                          text: Strings.history,
                          color: Colors.white,
                          size: 21,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: Get.width * 0.13,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.06, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: GestureDetector(
                              onTap: () {
                                controller.changeTab(0);
                              },
                              child: Card(
                                color: controller.selectedTab ==0?Color.fromARGB(255, 245, 85, 74):Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.greenAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      12.0), //<-- SEE HERE
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      const Center(
                                          child: Icon(
                                        FluentIcons.image_32_filled,
                                        size: 36,
                                        color:
                                            Color.fromARGB(255, 224, 222, 222),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextView(
                                        text: Strings.photos,
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 224, 222, 222),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: GestureDetector(
                              onTap: () {
                                controller.changeTab(1);
                                ;
                              },
                              child: Card(
                                color: controller.selectedTab==1?Color.fromARGB(255, 245, 85, 74):Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.greenAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      12.0), //<-- SEE HERE
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      const Center(
                                          child: Icon(
                                        FluentIcons.video_28_regular,
                                        size: 36,
                                        color:
                                            Color.fromARGB(255, 224, 222, 222),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextView(
                                        text: Strings.video,
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 224, 222, 222),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: GestureDetector(
                              onTap: () {
                                controller.changeTab(2);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.greenAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      12.0), //<-- SEE HERE
                                ),
                                color: controller.selectedTab==2?Color.fromARGB(255, 245, 85, 74):Colors.transparent,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      const Center(
                                          child: Icon(
                                        FluentIcons.music_note_2_24_regular,
                                        size: 36,
                                        color:
                                            Color.fromARGB(255, 224, 222, 222),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextView(
                                        text: Strings.audio,
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 224, 222, 222),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: GestureDetector(
                              onTap: () {
                                controller.changeTab(3);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.greenAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      12.0), //<-- SEE HERE
                                ),
                                color: controller.selectedTab==3?Color.fromARGB(255, 245, 85, 74):Colors.transparent,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      const Center(
                                          child: Icon(
                                        FluentIcons.folder_open_24_regular,
                                        size: 36,
                                        color:
                                            Color.fromARGB(255, 224, 222, 222),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextView(
                                        text: Strings.file,
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 224, 222, 222),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              stackedContainers(controller),
            ],
          ),
        ),
      );
    });
  }

  Widget stackedContainers(HistoryController controller) {
    return Expanded(
      child: IndexedStack(
        index: controller.selectedTab.value,
        children: [
          ImagesHistoryView(),
          VideoHistoryView(),
          AudioHistoryView(),
          FilesHistoryView(),
        ],
      ),
    );
  }
}
