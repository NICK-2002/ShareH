import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/send_receive_page_controller.dart';

class SendReceivePageView extends GetView<SendReceivePageController> {
  const SendReceivePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SendReceivePageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SendReceivePageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
