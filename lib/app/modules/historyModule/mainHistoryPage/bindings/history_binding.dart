import 'package:get/get.dart';
import 'package:share_h/app/modules/historyModule/audioHistory/controllers/audio_history_controller.dart';
import 'package:share_h/app/modules/historyModule/filesHistory/controllers/files_history_controller.dart';
import 'package:share_h/app/modules/historyModule/imagesHistory/controllers/images_history_controller.dart';
import 'package:share_h/app/modules/historyModule/videoHistory/controllers/video_history_controller.dart';

import '../controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
    Get.lazyPut<VideoHistoryController>(
      () => VideoHistoryController(),
    );
    Get.lazyPut<AudioHistoryController>(
      () => AudioHistoryController(),
    );
    Get.lazyPut<FilesHistoryController>(
      () => FilesHistoryController(),
    );
    Get.lazyPut<ImagesHistoryController>(
      () => ImagesHistoryController(),
    );
  }
}
