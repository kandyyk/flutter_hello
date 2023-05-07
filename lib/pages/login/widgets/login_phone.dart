import 'package:flutter/material.dart';
import 'package:flutter_hello/ui/theme.dart';

class LoginPhoneView extends StatefulWidget {
  final inputVC = TextEditingController();

  LoginPhoneView({super.key});

  @override
  State<LoginPhoneView> createState() => _LoginPhoneViewState();
}

class _LoginPhoneViewState extends State<LoginPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 36),
          child: const Text('手机号',
              style: TextStyle(fontSize: 16, color: Colors.black54)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextField(
            controller: widget.inputVC,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              hintText: '请输入手机号',
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
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
