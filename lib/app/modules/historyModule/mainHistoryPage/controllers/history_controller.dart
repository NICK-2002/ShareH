import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/data/fileTransfer_Database.dart';
import 'package:share_h/app/data/global.dart';
import 'package:share_h/app/model/fileDetails.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/audio_history_view.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/files_history_view.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/images_history_view.dart';
import 'package:share_h/app/modules/historyModule/mainHistoryPage/views/video_history_view.dart';
import 'package:share_h/app/modules/home/controllers/home_controller.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
  final home_controller = Get.put(HomeController());
  late List<FileDetails> user;
  Map<int, String> picture = {};
  Map<int, String> video = {};
  Map<int, String> audio = {};
  Map<int, String> files = {};
  List<String> videoThumbnailPath = [];
  int pictureIndex = 1;
  int videoIndex = 1;
  int audioIndex = 1;
  int filesIndex = 1;
  String count = "";
  var selectedTab = 0.obs;
  List<Widget> items = [
    ImagesHistoryView(),
    VideoHistoryView(),
    AudioHistoryView(),
    FilesHistoryView()
  ];
  int current = 0;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
    currentTab = 0;
    user = <FileDetails>[];
    refreshNote();
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

  refreshNote() async {
    user = await FileTransferDatabase.instance.readAllNotes();
    for (var i = 0; i < user.length; i++) {
      String? mimeStr = user[i].location;
      var fileType = mimeStr.split('.');
      if (fileType[1] == "jpg" ||
          fileType[1] == "jpeg" ||
          fileType[1] == "png" ||
          fileType[1] == "heic") {
        picture[pictureIndex] = mimeStr;
        pictureIndex++;
      } else if (fileType[1] == "mp4" ||
          fileType[1] == "m4p" ||
          fileType[1] == "mpeg" ||
          fileType[1] == "gif" ||
          fileType[1] == "m4v" ||
          fileType[1] == "mpg") {
        video[videoIndex] = mimeStr;
        videoIndex++;
        vidiothumnnail(user[i]);
      } else if (fileType[1] == "mp3" ||
          fileType[1] == "aac" ||
          fileType[1] == "aa" ||
          fileType[1] == "ogg" ||
          fileType[1] == "mmf" ||
          fileType[1] == "wma" ||
          fileType[1] == "m4p") {
        audio[audioIndex] = mimeStr;
        audioIndex++;
      } else {
        files[filesIndex] = mimeStr;
        filesIndex++;
      }
    }
    update();
  }

  changeTab(choosenTab) {
    selectedTab.value = choosenTab;
    currentTab = choosenTab;
    load(choosenTab);
    update();
  }

  load(int index) {
    selectedTab.value = index;
  }

  Future<String?> vidiothumnnail(FileDetails list) async {
    final filename = await VideoThumbnail.thumbnailFile(
      video: list.location,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight:
          64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    videoThumbnailPath.add(filename ?? "assets/icon/background.png");
    // user.forEach((element) {
    //   if (element.id == list.id) {
    //     element.location = filename!;
    //     print('repeats');
    //     update();
    //   }
    // });
  }

  void audioPlay(BuildContext context, String songUrl) {
    audioPlayer.play(songUrl);
    showModalBottomSheet(
      backgroundColor: Colors.grey[400],
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 15.0),
                    child: Container(
                      height: Get.height * 0.5,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: <Color>[
                                Color.fromARGB(255, 157, 189, 237),
                                Color.fromARGB(255, 218, 81, 248),
                                Color.fromARGB(255, 241, 167, 247),
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/icon/audioIcon.png",
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      audioPlayer.stop();
    });
  }
}
