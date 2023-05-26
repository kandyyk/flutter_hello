import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/profile/controllers/profile_controller.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:flutter_hello/ui/theme.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marquee/marquee.dart';

class ProfilePage extends GetView<ProfileController> {
  // const ProfilePage({super.key});

  ProfileController c = Get.put(ProfileController());
  // ProfileController c = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: _drawer(),
        key: controller.scaffoldKey,
        body: Stack(
          children: [
            Container(
              color: KKTheme.background,
              child: CustomScrollView(
                controller: controller.scrollController,
                // physics: BouncingScrollPhysics(), //ios风格的上拉出来空白
                physics: const ClampingScrollPhysics(),
                reverse: false,
                slivers: <Widget>[
                  _appBar(),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate(<Widget>[
                      _headInfo(),
                      _vipContainer(),
                      _creation(),
                      Container(
                        height: 500,
                      ),
                    ])),
                  )
                ],
              ),
            ),
            GetBuilder<ProfileController>(builder: (c) {
              return Positioned(
                left: c.avatarLeft,
                top: c.avatarTop,
                child: InkWell(
                  onTap: () {
                    controller.openDrawer();
                  },
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      width: c.avatarSize,
                      height: c.avatarSize,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      leading: Container(), //设置drawer的时候会加上默认leading,这里移除
      centerTitle: true,
      pinned: true, //AppBar是否固定在顶部
      floating: false,
      elevation: 0.0, //去除阴影
      backgroundColor: KKTheme.background, //SliverAppBar背景色
      actions: [
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.black87,
              size: 20,
            ),
          ),
          onTap: () {},
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.settings,
              color: Colors.black87,
              size: 20,
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }

  Widget _headInfo() {
    return Container(
      height: 60,
      margin: const EdgeInsets.fromLTRB(80, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '土豆土豆泥',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.rocket,
                    color: Colors.red[400],
                  ),
                  Icon(
                    Icons.abc,
                    color: Colors.green[400],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('累计观看699小时 · 共422天'),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Center(
              child: Row(children: const [
                Text('主页'),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _vipContainer() {
    return Container(
      height: 80,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.vipList.length,
          itemBuilder: (_, index) {
            return Container(
              margin: index != controller.vipList.length - 1
                  ? const EdgeInsets.only(right: 10)
                  : EdgeInsets.zero,
              width: 105,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.vipList[index].title ?? "",
                        style: TextStyle(
                            color: index < 2 ? KKTheme.vipTitle : Colors.black),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        controller.vipList[index].detail ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color:
                                index < 2 ? KKTheme.vipDetail : Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _creation() {
    // borderRadius: BorderRadius.circular(10),
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '创作中心',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: Colors.black12,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    height: 24,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.videocam_outlined,
                          size: 15,
                        ),
                        Text(
                          '发视频',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.creationList.map((e) {
              return InkWell(
                onTap: () {
                  Utils.toast(e['title']);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Icon(e['icon']),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        e['title'],
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const Divider(
            color: Colors.black12,
          ),
          Container(
            height: 20,
            margin: const EdgeInsets.only(bottom: 5),
            child: Swiper(
              itemCount: controller.notifications.length,
              scrollDirection: Axis.vertical,
              autoplay: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Icon(
                      Icons.campaign,
                      size: 20,
                      color: Colors.red[400],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      // child: Marquee(text: controller.notifications[index]),
                      child: Text(
                        controller.notifications[index],
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            //center 改变ClipOval大小
            child: Center(
              child: InkWell(
                onTap: () {
                  controller.openImagePicker();
                },
                child: Obx(() => ClipOval(
                      child: controller.avatarPath.isNotEmpty
                          ? Image.file(
                              File(controller.avatarPath.value),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            )
                          : const CircleAvatar(
                              radius: 60,
                              foregroundImage:
                                  AssetImage("assets/images/avatar.jpg"),
                            ),
                    )),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('主题'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('登录'),
              onTap: () {
                Get.toNamed(PageName.login);
              }),
        ],
      ),
    );
  }
}
