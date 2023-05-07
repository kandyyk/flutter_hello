import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CommunityController extends GetxController
    with GetTickerProviderStateMixin {
  CommunityController();

  final List<Tab> tabs = const [
    Tab(
      text: "发现",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "关注",
    ),
  ];

  int currentIndex = 0;
  // int _selected = 0;
  late TabController tabcontroller;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    tabcontroller = TabController(length: tabs.length, vsync: this);
    pageController = PageController(initialPage: currentIndex);
  }

  changePage(int index) {
    currentIndex = index;
    tabcontroller.animateTo(currentIndex);
  }
}
