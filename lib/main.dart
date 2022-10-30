import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
 
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
