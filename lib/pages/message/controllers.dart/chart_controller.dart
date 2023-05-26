import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/message/models/chart_model.dart';
import 'package:get/get.dart';

class ChartController extends GetxController {
  ChartController();
  late List<ChatModel> messages;
  late List<ItemModel> menuItems;
  CustomPopupMenuController popupController = CustomPopupMenuController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    messages = [
      ChatModel('在吗？'),
      ChatModel('咋了？找我有事吗？', isMe: true),
      ChatModel('没啥就像看看你在不在'),
      ChatModel('到底啥事你说啊，我还在工作呢', isMe: true),
      ChatModel('？', isMe: true),
      ChatModel('下面开始介绍Flutter'),
      ChatModel(
          'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。'),
      ChatModel('就这？？？', isMe: true),
      ChatModel('在吗？'),
      ChatModel('咋了？找我有事吗？', isMe: true),
      ChatModel('没啥就像看看你在不在'),
      ChatModel('到底啥事你说啊，我还在工作呢', isMe: true),
      ChatModel('？', isMe: true),
      ChatModel('下面开始介绍Flutter'),
      ChatModel(
          'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。'),
      ChatModel('就这？？？', isMe: true),
    ];
    menuItems = [
      ItemModel('发起群聊', Icons.chat_bubble),
      ItemModel('添加朋友', Icons.group_add),
      ItemModel('扫一扫', Icons.settings_overscan),
    ];
  }
}

class ChartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartController>(() => ChartController());
  }
}
