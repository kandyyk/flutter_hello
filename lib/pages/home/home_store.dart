import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/home/controllers/home_store_controller.dart';
import 'package:get/get.dart';

class HomeStorePage extends GetView<HomeStoreController> {
  const HomeStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
    ));
  }
}
