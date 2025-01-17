import 'package:flutter/material.dart';
import 'package:flutter_hello/common/Application.dart';
import 'package:flutter_hello/common/events.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  HomeController();

  List<Tab> tabs = const [
    Tab(
      text: "关注",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "发现",
    ),
  ];

  var hideNavBar = false.obs;
  RxInt currentIndex = 2.obs;
  // int _selected = 0;
  late TabController tabcontroller;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    tabcontroller = TabController(
        length: tabs.length, vsync: this, initialIndex: currentIndex.value);
    pageController = PageController(initialPage: currentIndex.value);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Application.eventBus.on<HideHomeNavBar>().listen((event) {
      hideNavBar.value = event.hide;
      update();
    });
  }

  //actions
  void tabTap(int index) {
    pageController.jumpToPage(index);
    update();
  }

  void pageViewChange(int index) {
    tabcontroller.animateTo(index);
    update();
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
