import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';

import '../controllers/send_receive_page_controller.dart';

class SendReceivePageView extends GetView<SendReceivePageController> {
  const SendReceivePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendReceivePageController>(builder: (controller) {
      return Scaffold(
          body: Stack(
        children: [
          Container(
            height: Get.height * 0.9,
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(2100),
                bottomRight: Radius.elliptical(10, 20),
              ),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: <Color>[
                    Color.fromARGB(255, 77, 133, 230),
                    Color.fromARGB(255, 5, 79, 205)
                  ]),
            ),
          ),
          SafeArea(
            child: Container(
              height: Get.height * 0.07,
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
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
                        controller.back();
                      },
                    ),
                    Center(
                      child: TextView(
                        text: Strings.app_Name,
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
          ),
          Center(
              child: controller.pageName == "Sender"
                  ? Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              controller.openImage(0);
                            },
                            child: Text("Image Picker")),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.openImage(1);
                            },
                            child: Text("video Picker")),
                      ],
                    )
                  : Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              controller.openImage(0);
                            },
                            child: Text("Image Picker")),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.openImage(1);
                            },
                            child: Text("video Picker")),
                      ],
                    )),
        ],
      ));
    });
  }
}
