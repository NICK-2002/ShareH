import 'dart:math';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
const String defualtimg = "assets/avatar/avatar5.png";
class Collection {
  static double diagonal =
      sqrt((Get.height * Get.height) + (Get.width * Get.width));
}

late final SharedPreferences prefs;
const String name = "USERNAME";
const String avatar = "AVATARIMAGE";
delete() async {
  await prefs.remove("USERNAME");
  await prefs.remove("AVATARIMAGE");
}

setImageurl(String url) async {
  await prefs.setString('AVATARIMAGE', url);
  print("saving-------------");
}

getImageurl() {
  final String? url = prefs.getString('AVATARIMAGE');
  print("$url--------------------");
  return url;
}

setUserName(String url) async {
  await prefs.setString('USERNAME', url);
  print("saving-------------");
}

getUserName() {
  final String? name = prefs.getString('USERNAME');
  print("$name--------------------");
  return name;
}
