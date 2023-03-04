import 'package:get/get.dart';

import '../modules/connectionPage/bindings/connection_page_binding.dart';
import '../modules/connectionPage/views/connection_page_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
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
  ];
}
