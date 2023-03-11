import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/audio_history_controller.dart';

class AudioHistoryView extends GetView<AudioHistoryController> {
  const AudioHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioHistoryController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Text(
              'AudioHistoryView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    );
  }
}
