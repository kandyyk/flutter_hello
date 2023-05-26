import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/home/controllers/home_recommend_controller.dart';
import 'package:flutter_hello/pages/home/views/action_button.dart';
import 'package:flutter_hello/ui/keep_alive_wrapper.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_hello/pages/home/views/video_view.dart';
import 'package:flutter_hello/utils/assets_helper.dart';

class HomeRecommendPage extends GetView<HomeRecommendController> {
  HomeRecommendController c = Get.put(HomeRecommendController());
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Container(
        color: Colors.black,
        child: PageView.builder(
          controller: c.pageController,
          scrollDirection: Axis.vertical,
          itemCount: 30,
          itemBuilder: (context, index) => Stack(
            children: [
              Obx(
                () => AnimatedPositioned(
                    width: screenW,
                    height: c.videoH.value,
                    duration: const Duration(milliseconds: 300),
                    child: c.getVideoView(index)),
              ),
              _actions(),
              _about(),
            ],
          ),
          // onPageChanged: (index) => c.playCurrentVideo(),
        ),
      ),
    );

    // return Container(
    //   color: Colors.black,
    //   child: PageView(
    //     scrollDirection: Axis.vertical,
    //     children: [],
    //     onPageChanged: (index) => c.currentVideoIndex = index,
    //   ),
    // );
  }

  static const List actionButtons = [];
//右侧事件区域：关注，点赞。。
  Widget _actions() {
    return Positioned(
        right: 0,
        bottom: 50.w,
        width: 50.w,
        height: 240.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            likeButton(),
            _commentButton(),
            _collectButton(),
            _shareButton()
          ],
        ));
  }

  static const aboutH = 40.0;
//相关视屏
  Widget _about() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: aboutH,
      child: Stack(
        children: [
          Container(
            color: Colors.black.withAlpha(40),
          ),
          InkWell(
            onTap: () {},
            onLongPress: () {},
            child: SizedBox(
              height: aboutH,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.video_camera_back_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Text(
                    '相关视频·iphone14Pro更多信息',
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Spacer(),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          //系统滑动条太丑了，后期再造
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: -20,
          //   child: Obx(() => Slider(
          //         value: c.progress.value,
          //         activeColor: Colors.white,
          //         thumbColor: Colors.white,
          //         inactiveColor: Colors.white,
          //         onChanged: (percent) {
          //           c.slider(percent);
          //         },
          //       )),
          // ),
        ],
      ),
    );
  }

  Widget likeButton() {
    return ActionButton(
      icon: Image.asset(
        'assets/images/red_heart.webp',
        color: Colors.white,
        width: 40,
      ),
      actionIcon: Image.asset(
        'assets/images/red_heart.webp',
        width: 40,
      ),
      text: "12.5万",
      onTap: () {},
    );
  }

  Widget _commentButton() {
    return ActionButton(
      icon: Image.asset(
        'assets/images/comment.webp',
        width: 40,
      ),
      text: "45.0万",
      onTap: () async {
        c.commentLayout();
        var _ = await Get.bottomSheet(
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            height: screenH * 2 / 3,
          ),
          isScrollControlled: true,
          //遮罩颜色
          barrierColor: Colors.transparent,
        );
        c.commentLayout();
      },
    );
  }

  Widget _collectButton() {
    return ActionButton(
      icon: Image.asset(
        AssetsHelper.collectionWhite,
        width: 40,
      ),
      actionIcon: Image.asset(
        AssetsHelper.collectionYellow,
        width: 40,
      ),
      text: "3.4万",
      onTap: () {},
    );
  }

  Widget _shareButton() {
    return ActionButton(
      icon: Image.asset(
        'assets/images/share.webp',
        width: 40,
      ),
      text: "1.5万",
      onTap: () {},
    );
  }
}
