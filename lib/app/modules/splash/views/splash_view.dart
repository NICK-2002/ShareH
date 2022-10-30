import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Vx.gray200,
          body: Stack(
            children: <Widget>[
              Container(
                height: Get.height * 0.6,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.elliptical(100, 60)),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: <Color>[
                      Color.fromARGB(255, 77, 133, 230),
                      Color.fromARGB(255, 29, 103, 231),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.12),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: Collection.diagonal * 0.2,
                        ),
                        const Text(
                          "ShareH",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.6),
                child: const Center(
                    child: Text("Share File Instantly Like A Flash",
                        style: TextStyle(
                            color: Vx.gray900,
                            fontSize: 18,
                            fontWeight: FontWeight.w300))),
              )
            ],
          ));
    });
  }
}
