import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/login/widgets/login_action.dart';
import 'package:flutter_hello/pages/login/widgets/login_phone.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:flutter_hello/ui/theme.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  late final phone = LoginPhoneView();
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          highlightColor: Colors.transparent, // 清除动效
          splashColor: Colors.transparent, // 透明色
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SizedBox(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(),
                      widget.phone,
                      verification(),
                      const LoginActionView(isPasswordLogin: false),
                    ],
                  ),
                ),
              ),
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

  Widget verification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text('验证码',
              style: TextStyle(fontSize: 16, color: Colors.black54)),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                keyboardType: TextInputType.phone,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: '请输入验证码',
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
            Positioned(
                right: 0,
                top: 8,
                child: InkWell(
                  onTap: () {
                    debugPrint('click verify code');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '获取验证码',
                      style: TextStyle(
                        fontSize: 15,
                        color: KKTheme.primary,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
