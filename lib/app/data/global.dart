import 'package:get/get.dart';

int currentTab = 0;
class GlobalVar extends GetxController {
  static GlobalVar get to => Get.find<GlobalVar>();
  RxDouble dowlnload = 0.0.obs;
}

