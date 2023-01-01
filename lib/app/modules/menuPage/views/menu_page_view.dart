import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_page_controller.dart';

class MenuPageView extends GetView<MenuPageController> {
  const MenuPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenuPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MenuPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
