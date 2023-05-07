import 'package:flutter/material.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:get/get.dart';
import 'package:flutter_hello/ui/theme.dart';

class LoginActionView extends StatefulWidget {
  final bool isPasswordLogin;
  const LoginActionView({super.key, required this.isPasswordLogin});

  @override
  State<LoginActionView> createState() => _LoginActionViewState();
}

class _LoginActionViewState extends State<LoginActionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 36),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: KKTheme.primary,
            borderRadius: KKTheme.radius,
          ),
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              //密码登录pop两次
              if (widget.isPasswordLogin) {
                Get.back();
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: KKTheme.primary),
            child: const Text('登录'),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      if (widget.isPasswordLogin) {
                        Get.back();
                      } else {
                        Get.toNamed(PageName.forgotPassword);
                      }
                    },
                    child: Text(
                      widget.isPasswordLogin ? '验证码登录' : '密码登录',
                      style: TextStyle(color: KKTheme.primary, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        debugPrint('click forgot password');
                      },
                      child: widget.isPasswordLogin
                          ? Text(
                              '忘记密码?',
                              style: TextStyle(
                                  color: KKTheme.secondary, fontSize: 12),
                            )
                          : const Text(''),
                    )),
              ],
            )),
      ],
    );
  }
}
