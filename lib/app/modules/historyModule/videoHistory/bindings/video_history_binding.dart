import 'package:get/get.dart';

import '../controllers/video_history_controller.dart';

class VideoHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoHistoryController>(
      () => VideoHistoryController(),
    );
  }
}
