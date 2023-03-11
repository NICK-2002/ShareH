import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/images_history_controller.dart';

class ImagesHistoryView extends GetView<ImagesHistoryController> {
  const ImagesHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagesHistoryController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Text(
              'ImagesHistoryView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    );
  }
}