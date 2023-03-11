import 'package:get/get.dart';
import 'package:share_h/app/modules/send_receive_page/controllers/send_receive_page_controller.dart';

import '../controllers/connection_page_controller.dart';

class ConnectionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionPageController>(
      () => ConnectionPageController(),
    );
    Get.lazyPut<SendReceivePageController>(
      () => SendReceivePageController(),
    );
  }
}
