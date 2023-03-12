import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/widget/textview.dart';

import '../controllers/images_history_controller.dart';

class ImagesHistoryView extends GetView<ImagesHistoryController> {
  const ImagesHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagesHistoryController>(builder: (controller) {
      return Scaffold(
        body: Center(
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
                  "assets/history_empty_view/emptyimageView.png",
                  fit: BoxFit.fill,
                )),
            TextView(
              text: "No Photos(s) Received",
              size: 21,
              color: Color.fromARGB(255, 168, 167, 167),
            )
          ],
        )),
      );
    });
  }
}
