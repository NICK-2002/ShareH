import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_animation/ripple_animation.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/connection_page_controller.dart';

class ConnectionPageView extends GetView<ConnectionPageController> {
  const ConnectionPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectionPageController>(builder: (controller) {
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
                      onPressed: () => Get.back(),
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
            child: RippleAnimation(
              color: Vx.gray100,
              duration: Duration(seconds: 3),
              ripplesCount: 5,
              minRadius: Get.width * 0.21,
              repeat: true,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Center(
                  child: Icon(
                    controller.pageName == 'Sender'
                        ? CupertinoIcons.paperplane_fill
                        : CupertinoIcons.tray_arrow_down_fill,
                    color: const Color.fromARGB(255, 5, 79, 205),
                    size: 48,
                  ),
                ),
              ),
            ),
          )
        ],
      ));
    });
  }
}
