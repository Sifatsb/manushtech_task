import 'package:get/get.dart';

import '../controllers/photo_list_page_controller.dart';

class PhotoListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoListPageController>(
      () => PhotoListPageController(),
    );
  }
}
