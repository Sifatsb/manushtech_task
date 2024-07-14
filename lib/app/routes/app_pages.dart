import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/photo_list_page/bindings/photo_list_page_binding.dart';
import '../modules/photo_list_page/views/photo_list_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_LIST_PAGE,
      page: () => const PhotoListPageView(),
      binding: PhotoListPageBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
