import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/data/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  Get.put(GlobalVar());
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
