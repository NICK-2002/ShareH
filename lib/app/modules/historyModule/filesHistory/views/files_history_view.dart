import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/controllers/history_controller.dart';
import 'package:share_h/app/widget/textview.dart';

import '../controllers/files_history_controller.dart';

class FilesHistoryView extends GetView<HistoryController> {
  const FilesHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      return Scaffold(
        body: controller.files.isEmpty
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
                  "assets/history_empty_view/emptyFileView.png",
                  fit: BoxFit.fill,
                )),
            TextView(
              text: "No File(s) Received",
              size: 21,
              color: Color.fromARGB(255, 168, 167, 167),
            )
          ],
        )):Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: controller.files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: FileImage(
                                      File("${controller.files[index + 1]}")),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }),
              ),
      );
    });
  }
}
