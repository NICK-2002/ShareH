import 'package:get/get.dart';

class PhotoShowController extends GetxController {
  //TODO: Implement PhotoShowController
  var data = Get.arguments;
  RxString sc = "".obs;
  @override
  void onInit() {
    sc.value = data[0];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
