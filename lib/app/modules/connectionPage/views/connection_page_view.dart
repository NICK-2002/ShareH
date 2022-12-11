import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/connection_page_controller.dart';

class ConnectionPageView extends GetView<ConnectionPageController> {
  const ConnectionPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectionPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ConnectionPageView'),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'ConnectionPageView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    );
  }
}
