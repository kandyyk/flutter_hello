import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/home/controllers/home_notice_controller.dart';
import 'package:get/get.dart';

class HomeNoticePage extends GetView<HomeNoticeController> {
  const HomeNoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.orange,
    ));
  }
}
