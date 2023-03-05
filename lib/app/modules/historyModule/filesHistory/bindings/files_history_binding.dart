import 'package:get/get.dart';

import '../controllers/files_history_controller.dart';

class FilesHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilesHistoryController>(
      () => FilesHistoryController(),
    );
  }
}
