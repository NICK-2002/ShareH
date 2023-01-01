import 'dart:math';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Collection {
  static double diagonal =
      sqrt((Get.height * Get.height) + (Get.width * Get.width));
}

//final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

late final SharedPreferences prefs;
const String name = "USERNAME";

delete() async {
  await prefs.remove("USERNAME");
}

setImageurl(String url) async {
  await prefs.setString('USERNAME', url);
}

getImageurl() {
  final String? url = prefs.getString('USERNAME');
  return url;
}
