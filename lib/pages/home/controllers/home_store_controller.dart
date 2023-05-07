import 'package:get/get.dart';

class HomeStoreController extends GetxController {
  HomeStoreController();
}

class HomeStoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStoreController>(() => HomeStoreController());
  }
}
