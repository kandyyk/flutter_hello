import 'package:get/get.dart';

class HomeNoticeController extends GetxController {
  HomeNoticeController();
}

class HomeNoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNoticeController>(() => HomeNoticeController());
  }
}
