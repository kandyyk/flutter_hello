import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/controllers/community_controller.dart';
import 'package:flutter_hello/pages/community/found.dart';
import 'package:flutter_hello/pages/community/recommend.dart';
import 'package:flutter_hello/ui/keep_alive_wrapper.dart';
import 'package:flutter_hello/ui/theme.dart';

import 'like.dart';

import 'package:get/get.dart';

class CommunityPage extends GetView<CommunityController> {
  var c = Get.put(CommunityController());

  CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: DefaultTabController(
          length: c.tabs.length,
          child: Column(
            children: [
              appBar(),
              Expanded(
                  child: PageView(
                controller: c.pageController,
                onPageChanged: c.changePage,
                children: const [
                  FoundPageView(),
                  RecommendPageView(),
                  LikePageView(),
                ],
              )),
            ],
          )),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: TabBar(
        tabs: c.tabs,
        controller: c.tabcontroller,
        onTap: c.changePage,
        indicatorColor: KKTheme.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: KKTheme.base,
        labelStyle: KKTheme.boldText,
        unselectedLabelStyle: KKTheme.defaultText,
        unselectedLabelColor: KKTheme.secondary,
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.email_outlined,
              size: 24,
            ),
          ),
        )
      ],
    );
  }
}
