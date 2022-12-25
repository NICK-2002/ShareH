import 'package:get/get.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';

import '../controllers/send_receive_page_controller.dart';

class SendReceivePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendReceivePageController>(
      () => SendReceivePageController(),
    );
  }
}
