import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';
import 'package:share_h/app/routes/app_pages.dart';

class SendReceivePageController extends GetxController {
  //TODO: Implement SendReceivePageController
dynamic argumentData = Get.arguments;
  String pageName = "";
  final home_controller = Get.put(HomeController());
  final count = 0.obs;
  String? tempFileUri;
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
  void back() async {
    Get.offAllNamed(Routes.HOME);
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    // endpointMap.clear();
    // update();
  }

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
