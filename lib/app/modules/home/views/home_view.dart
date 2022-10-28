import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
                height: Get.height * 0.85,
                width: Get.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Color.fromARGB(255, 62, 136, 240),
                      Color.fromARGB(255, 47, 133, 244),
                    ],
                    //  tileMode: TileMode.mirror,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(400),
                  ),
                )),
          ],
        ));
  }
}
