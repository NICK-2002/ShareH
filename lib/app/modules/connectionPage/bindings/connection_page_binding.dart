import 'package:get/get.dart';

import '../controllers/connection_page_controller.dart';

class ConnectionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionPageController>(
      () => ConnectionPageController(),
    );
  }
}
