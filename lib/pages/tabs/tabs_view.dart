import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/community.dart';
import 'package:flutter_hello/pages/home/home.dart';
import 'package:flutter_hello/pages/message/message.dart';
import 'package:flutter_hello/pages/profile/profile.dart';
import 'package:flutter_hello/pages/store/store.dart';
import 'package:flutter_hello/pages/tabs/controllers/tabs_controller.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabsPage extends GetView<TabsController> {
  const TabsPage({super.key});

  Color get _tabItemColor {
    return controller.currentIndex.value == 0 ? Colors.white : Colors.black;
  }

  Color get _tabbarColor {
    return controller.currentIndex.value == 0 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            HomePage(),
            CommunityPage(),
            StorePage(),
            const MessagePage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Obx(
          () => SalomonBottomBar(
            backgroundColor: _tabbarColor,
            currentIndex: controller.currentIndex.value,
            onTap: controller.selectIndex,
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.home,
                  color: _tabItemColor,
                ),
                title: Text(
                  "首页",
                  style: TextStyle(color: _tabItemColor),
                ),
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: _tabItemColor,
                ),
                title: Text(
                  "社区",
                  style: TextStyle(color: _tabItemColor),
                ),
              ),

              ///store
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: _tabItemColor,
                ),
                title: Text(
                  "商城",
                  style: TextStyle(color: _tabItemColor),
                ),
              ),

              /// message
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: _tabItemColor,
                ),
                title: Text(
                  "消息",
                  style: TextStyle(color: _tabItemColor),
                ),
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.person,
                  color: _tabItemColor,
                ),
                title: Text(
                  "我的",
                  style: TextStyle(color: _tabItemColor),
                ),
              ),
            ],
          ),
        ));
  }
}
