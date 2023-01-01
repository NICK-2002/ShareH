import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  prefs = await SharedPreferences.getInstance();
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
