import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/photo_show_controller.dart';

class PhotoShowView extends GetView<PhotoShowController> {
  const PhotoShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoShowController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            InteractiveViewer(
              panEnabled: true,
              boundaryMargin: EdgeInsets.zero,
              minScale: 1,
              maxScale: 2,
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: <Color>[
                          Color.fromARGB(255, 77, 133, 230),
                          Color.fromARGB(255, 5, 79, 205)
                        ]),
                    image: DecorationImage(
                        image: FileImage(File(controller.sc.value)),
                        fit: BoxFit.cover)),
              ),
            ),
            // Center(
            //   child: InteractiveViewer(
            //     panEnabled: false, // Set it to false
            //     boundaryMargin: EdgeInsets.all(100),
            //     minScale: 0.5,
            //     maxScale: 2,
            //     child:
            //     Image.asset(
            //       'your_image_asset',
            //       width: Get.width,
            //       height: Get.height,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
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
        )),
      );
    });
  }
}
