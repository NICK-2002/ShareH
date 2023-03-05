import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';

class MenuPageController extends GetxController {
  //TODO: Implement MenuPageController
  String username = "";
  String url = "";
  @override
  void onInit() {
    updateDetails();
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

  updateDetails() {
    username = getUserName() ?? "ShareH";
    url = getImageurl() ?? defualtimg;
    update();
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'ShareH',
      text: 'Share File instantly like a flash',
      linkUrl: 'https://flutter.dev/',
      chooserTitle: 'Sahring Application'
    );
  }
}
