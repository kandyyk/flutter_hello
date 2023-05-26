import 'package:flutter/material.dart';
import 'package:flutter_hello/common/Application.dart';
import 'package:flutter_hello/common/events.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter_hello/pages/home/views/video_view.dart';

class HomeRecommendController extends GetxController {
  HomeRecommendController();

  PageController pageController = PageController(keepPage: true);

  VideoView? currentVideoView;
  int currentIndex = 0;
  bool isInit = true;

  var videoList = List.generate(10, (index) => "assets/videos/$index.MP4");
  var progress = 0.0.obs; //进度条
  var videoH = screenH.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    pageController.addListener(() {
      double? page = pageController.page;
      if (page == currentIndex) {
        playCurrentVideo();
      }
    });
  }

//暂未考虑刷新数据的问题
  VideoView getVideoView(int index) {
    if (currentIndex == index && currentVideoView != null) {
      return currentVideoView!;
    }
    VideoView videoView = VideoView(
      videoList[index % videoList.length],
      key: GlobalKey(),
      loaded: () {
        //第一个视屏默认播放
        if (isInit) {
          playCurrentVideo();
          isInit = false;
        }
      },
    );
    currentVideoView = videoView;
    currentIndex = index;
    return videoView;
  }

  //actions
  playCurrentVideo() {
    if (currentVideoView == null) {
      return;
    }
    if (currentVideoView!.isPlaying) {
      return;
    }
    currentVideoView?.play();
  }

  stopCurrentVideo() {
    if (currentVideoView == null) {
      return;
    }
    if (!currentVideoView!.isPlaying) {
      return;
    }
    currentVideoView?.pause();
  }

  slider(double progress) {
    this.progress.value = progress;
  }

  commentLayout() {
    if (currentVideoView == null) {
      return;
    }
    if (videoH.value == screenH) {
      videoH.value = screenH * 1 / 3;
      Application.eventBus.fire(HideHomeNavBar(true));
    } else {
      videoH.value = screenH;
      Application.eventBus.fire(HideHomeNavBar(false));
    }
    update();
  }

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
}

class HomeRecommendBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRecommendController>(() => HomeRecommendController());
  }
}
