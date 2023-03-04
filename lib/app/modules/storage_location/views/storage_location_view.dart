import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/storage_location_controller.dart';

class StorageLocationView extends GetView<StorageLocationController> {
  const StorageLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StorageLocationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StorageLocationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
