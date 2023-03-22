import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/controllers/history_controller.dart';
import 'package:share_h/app/widget/textview.dart';

class AudioHistoryView extends GetView<HistoryController> {
  const AudioHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      return Scaffold(
        body: controller.user.isEmpty
            ? Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.width * 0.2,
                  ),
                  Container(
                      width: Get.width,
                      height: Get.height * 0.4,
                      child: Image.asset(
                        "assets/history_empty_view/emptyaudioView.png",
                        fit: BoxFit.fill,
                      )),
                  const TextView(
                    text: "No Photos(s) Received",
                    size: 21,
                    color: Color.fromARGB(255, 168, 167, 167),
                  )
                ],
              ))
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: controller.audio.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: controller.audio.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), //<-- SEE HERE
                                ),
                                child: GridTile(
                                  footer: const Center(
                                      child: TextView(
                                    text: "audioFile",
                                    color: Colors.white,
                                  )),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: <Color>[
                                            Color.fromARGB(255, 157, 189, 237),
                                            Color.fromARGB(255, 218, 81, 248),
                                            Color.fromARGB(255, 241, 167, 247),
                                          ]),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                            "assets/icon/audioIcon.png")),
                                  ),
                                )),
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
      );
    });
  }
}
