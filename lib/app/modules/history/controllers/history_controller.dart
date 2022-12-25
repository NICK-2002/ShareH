import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
  final home_controller = Get.put(HomeController());
  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
  Future<void> openImage() async {
    {
      PickedFile? file =
          await ImagePicker().getImage(source: ImageSource.gallery);

      if (file == null) return;

      for (MapEntry<String, ConnectionInfo> m
          in home_controller.endpointMap.entries) {
        int payloadId = await Nearby().sendFilePayload(m.key, file.path);
        home_controller.showSnackbar("Sending file to ${m.key}");
        Nearby().sendBytesPayload(
            m.key,
            Uint8List.fromList(
                "$payloadId:${file.path.split('/').last}".codeUnits));
      }
    }
    ;
  }
}
