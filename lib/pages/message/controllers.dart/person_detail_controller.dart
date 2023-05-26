import 'package:get/get.dart';

class PersonDetailController extends GetxController {
  PersonDetailController();
}

class PersonDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonDetailController>(() => PersonDetailController());
  }
}
