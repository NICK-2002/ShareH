import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/photo_show_controller.dart';

class PhotoShowView extends GetView<PhotoShowController> {
  const PhotoShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoShowView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PhotoShowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
