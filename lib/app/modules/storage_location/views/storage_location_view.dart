import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';

import '../controllers/storage_location_controller.dart';

class StorageLocationView extends GetView<StorageLocationController> {
  const StorageLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StorageLocationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.08,
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Center(
                        child: TextView(
                          text: Strings.storageLocation,
                          color: Colors.white,
                          size: 21,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.13,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: Get.height * 0.1, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // For App
                      /*Card(
                        child: ListTile(
                          leading: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        Color.fromARGB(255, 101, 148, 230),
                                        Color.fromARGB(255, 68, 114, 192)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Icon(
                                FluentIcons.app_folder_28_regular,
                                color: Color.fromARGB(255, 2, 89, 161),
                                size: 32,
                              ))),
                          title: TextView(
                            text: Strings.app,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: TextView(text: "/Internal Storage/ShareH"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),*/
                      Card(
                        child: ListTile(
                          leading: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        Color.fromARGB(255, 235, 209, 201),
                                        Color.fromARGB(255, 236, 167, 130)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Icon(
                                FluentIcons.image_32_filled,
                                color: Color.fromARGB(255, 240, 120, 21),
                                size: 32,
                              ))),
                          title: TextView(
                            text: Strings.photos,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: TextView(text: "/Internal Storage/ShareH"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: ListTile(
                          leading: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        Color.fromARGB(255, 176, 217, 177),
                                        Color.fromARGB(255, 140, 207, 120)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Icon(
                                FluentIcons.video_28_regular,
                                color: Color.fromARGB(255, 42, 194, 64),
                                size: 32,
                              ))),
                          title: TextView(
                            text: Strings.video,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: TextView(text: "/Internal Storage/ShareH"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: ListTile(
                          leading: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        Color.fromARGB(255, 218, 218, 154),
                                        Color.fromARGB(255, 223, 230, 122)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Icon(
                                FluentIcons.music_note_2_24_regular,
                                color: Color.fromARGB(255, 220, 202, 39),
                                size: 32,
                              ))),
                          title: TextView(
                            text: Strings.audio,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: TextView(text: "/Internal Storage/ShareH"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: ListTile(
                          leading: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        Color.fromARGB(255, 218, 154, 209),
                                        Color.fromARGB(255, 201, 108, 193)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Icon(
                                FluentIcons.folder_open_24_regular,
                                color: Color.fromARGB(255, 220, 39, 208),
                                size: 32,
                              ))),
                          title: TextView(
                            text: Strings.file,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: TextView(text: "/Internal Storage/ShareH"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
