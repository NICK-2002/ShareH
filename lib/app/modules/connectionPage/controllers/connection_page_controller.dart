import 'package:get/get.dart';

class ConnectionPageController extends GetxController {
  //TODO: Implement ConnectionPageController
  dynamic argumentData = Get.arguments;
  String pageName = "";
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageName = argumentData[0];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
