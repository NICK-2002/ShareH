import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/files_history_controller.dart';

class FilesHistoryView extends GetView<FilesHistoryController> {
  const FilesHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilesHistoryController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Text(
              'FilesHistoryView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    );
  }
}
