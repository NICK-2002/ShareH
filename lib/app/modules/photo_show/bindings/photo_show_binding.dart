import 'package:get/get.dart';

import '../controllers/photo_show_controller.dart';

class PhotoShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoShowController>(
      () => PhotoShowController(),
    );
  }
}
