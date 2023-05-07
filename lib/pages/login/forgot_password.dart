import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/login/controllers/forgot_password_controller.dart';
import 'package:flutter_hello/pages/login/widgets/login_action.dart';
import 'package:flutter_hello/ui/theme.dart';

import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  final c = Get.put(ForgotPasswordController());

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            // print(c.phoneView.inputVC.text);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                c.phoneView,
                password(),
                const LoginActionView(isPasswordLogin: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return const Text(
      '登录/注册',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  Widget password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text('密码',
              style: TextStyle(fontSize: 16, color: KKTheme.placeholder)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: '请输入密码',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: KKTheme.outline,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: KKTheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
