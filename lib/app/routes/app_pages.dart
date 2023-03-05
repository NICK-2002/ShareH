import 'package:get/get.dart';

import '../modules/connectionPage/bindings/connection_page_binding.dart';
import '../modules/connectionPage/views/connection_page_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/historyModule/audioHistory/bindings/audio_history_binding.dart';
import '../modules/historyModule/audioHistory/views/audio_history_view.dart';
import '../modules/historyModule/filesHistory/bindings/files_history_binding.dart';
import '../modules/historyModule/filesHistory/views/files_history_view.dart';
import '../modules/historyModule/mainHistoryPage/bindings/history_binding.dart';
import '../modules/historyModule/mainHistoryPage/views/history_view.dart';
import '../modules/historyModule/imagesHistory/bindings/images_history_binding.dart';
import '../modules/historyModule/imagesHistory/views/images_history_view.dart';
import '../modules/historyModule/videoHistory/bindings/video_history_binding.dart';
import '../modules/historyModule/videoHistory/views/video_history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/menuPage/bindings/menu_page_binding.dart';
import '../modules/menuPage/views/menu_page_view.dart';
import '../modules/send_receive_page/bindings/send_receive_page_binding.dart';
import '../modules/send_receive_page/views/send_receive_page_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/storage_location/bindings/storage_location_binding.dart';
import '../modules/storage_location/views/storage_location_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CONNECTION_PAGE,
      page: () => const ConnectionPageView(),
      binding: ConnectionPageBinding(),
    ),
    GetPage(
      name: _Paths.SEND_RECEIVE_PAGE,
      page: () => const SendReceivePageView(),
      binding: SendReceivePageBinding(),
    ),
    GetPage(
      name: _Paths.MENU_PAGE,
      page: () => const MenuPageView(),
      binding: MenuPageBinding(),
    ),
    GetPage(
      name: _Paths.STORAGE_LOCATION,
      page: () => const StorageLocationView(),
      binding: StorageLocationBinding(),
    ),
    GetPage(
      name: _Paths.AUDIO_HISTORY,
      page: () => const AudioHistoryView(),
      binding: AudioHistoryBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_HISTORY,
      page: () => const VideoHistoryView(),
      binding: VideoHistoryBinding(),
    ),
    GetPage(
      name: _Paths.FILES_HISTORY,
      page: () => const FilesHistoryView(),
      binding: FilesHistoryBinding(),
    ),
    GetPage(
      name: _Paths.IMAGES_HISTORY,
      page: () => const ImagesHistoryView(),
      binding: ImagesHistoryBinding(),
    ),
  ];
}
