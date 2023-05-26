import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/home/controllers/home_controller.dart';
import 'package:flutter_hello/pages/home/home_notice.dart';
import 'package:flutter_hello/pages/home/home_recommend.dart';
import 'package:flutter_hello/pages/home/home_store.dart';
import 'package:flutter_hello/ui/keep_alive_wrapper.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  var c = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return KeepAliveWrapper(
      child: Stack(children: [
        DefaultTabController(
          length: c.tabs.length,
          child: PageView(
            allowImplicitScrolling: true, //避免子页面销毁
            controller: c.pageController,
            onPageChanged: c.pageViewChange,
            children: [
              const HomeNoticePage(),
              const HomeStorePage(),
              HomeRecommendPage(),
            ],
          ),
        ),
        _tabBar(),
      ]),
    );
  }

  Widget _tabBar() {
    return Obx(
      () => c.hideNavBar.value
          ? Container()
          : SafeArea(
              child: SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  title: TabBar(
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    indicatorWeight: 2.5,
                    tabs: c.tabs,
                    controller: c.tabcontroller,
                    onTap: c.tabTap,
                  ),
                  leading: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.qr_code_scanner_outlined,
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: 60,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
