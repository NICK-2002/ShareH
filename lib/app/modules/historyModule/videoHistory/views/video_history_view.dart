import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_history_controller.dart';

class VideoHistoryView extends GetView<VideoHistoryController> {
  const VideoHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoHistoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VideoHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
