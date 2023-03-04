import 'package:get/get.dart';

import '../controllers/storage_location_controller.dart';

class StorageLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageLocationController>(
      () => StorageLocationController(),
    );
  }
}
