import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/widget/circleview.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
      ),
      body: Center(
          child: CircleView(
              height: 250,
              width: 250,
              fillColor: Colors.orange,
              borderColor: Colors.greenAccent,
              child: Image.asset(
                "assets/avatar/avatar2.png",
                height: 250,
                width: 250,
                fit: BoxFit.none,
              ))),
    );
  }
}
