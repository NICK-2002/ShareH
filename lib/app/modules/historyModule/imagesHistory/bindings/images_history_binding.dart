import 'package:get/get.dart';

import '../controllers/images_history_controller.dart';

class ImagesHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagesHistoryController>(
      () => ImagesHistoryController(),
    );
  }
}
