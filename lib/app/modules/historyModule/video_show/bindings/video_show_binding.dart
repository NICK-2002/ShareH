import 'package:get/get.dart';

import '../controllers/video_show_controller.dart';

class VideoShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoShowController>(
      () => VideoShowController(),
    );
  }
}
