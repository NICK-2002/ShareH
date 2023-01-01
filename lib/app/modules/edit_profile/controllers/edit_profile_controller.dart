import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/modules/menuPage/controllers/menu_page_controller.dart';
import 'package:share_h/app/strings/string.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  List<String> avatarUrl = [
    "assets/avatar/avatar1.png",
    "assets/avatar/avatar2.png",
    "assets/avatar/avatar3.png",
    "assets/avatar/avatar4.png",
    "assets/avatar/avatar5.png",
    "assets/avatar/avatar6.png",
    "assets/avatar/avatar7.png",
    "assets/avatar/avatar8.png",
    "assets/avatar/avatar9.png",
    "assets/avatar/avatar10.png",
  ];
  TextEditingController userName = TextEditingController();
  String currentAvatar = "";
  @override
  void onInit() {
    userName.text = getUserName() ?? "ShareH";
    currentAvatar = getImageurl() ?? defualtimg;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setImageString(String imageurl) {
    currentAvatar = imageurl;
    update();
  }

  upadateData(String url, String name) {
    setImageurl(url);
    setUserName(name);
    currentAvatar = url;
    userName.text = name;
    Get.find<MenuPageController>().updateDetails();
    Get.snackbar("Your Profile is Updated", "Your Profile is Updated");
    update();
  }
}
