import 'package:get/get.dart';

import '../controllers/menu_page_controller.dart';

class MenuPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuPageController>(
      () => MenuPageController(),
    );
  }
}
