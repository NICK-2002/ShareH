import 'package:get/get.dart';

import '../controllers/audio_history_controller.dart';

class AudioHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioHistoryController>(
      () => AudioHistoryController(),
    );
  }
}
