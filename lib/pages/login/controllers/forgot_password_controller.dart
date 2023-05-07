import 'package:flutter_hello/pages/login/widgets/login_phone.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final LoginPhoneView phoneView = LoginPhoneView();

  void login() {}
}

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
