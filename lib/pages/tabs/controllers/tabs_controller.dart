import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/home/controllers/home_recommend_controller.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  PageController pageController = PageController(keepPage: true);
  var currentIndex = 0.obs;

  TabsController();

  void selectIndex(int i) {
    currentIndex.value = i;
    pageController.jumpToPage(i);
    //切换tab的时候停止首页播放
    HomeRecommendController c = Get.find();
    if (i != 0) {
      c.stopCurrentVideo();
    } else {
      c.playCurrentVideo();
    }
    update();
  }

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
}

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
  }
}
