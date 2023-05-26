import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/message/controllers.dart/chart_controller.dart';
import 'package:flutter_hello/pages/message/models/chart_model.dart';
import 'package:get/get.dart';

class ChartPage extends GetView<ChartController> {
  ChartController c = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          CustomPopupMenu(
            child: Container(
              child: Icon(Icons.add_circle_outline, color: Colors.white),
              padding: EdgeInsets.all(20),
            ),
            menuBuilder: () => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: const Color(0xFF4C4C4C),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: c.menuItems
                        .map(
                          (item) => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              c.popupController.hideMenu();
                            },
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    item.icon,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        item.title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            pressType: PressType.singleClick,
            verticalMargin: -10,
            controller: c.popupController,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                children: c.messages
                    .map(
                      (message) => MessageContent(
                        message,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageContent extends StatelessWidget {
  MessageContent(this.message);

  final ChatModel message;
  List<ItemModel> menuItems = [
    ItemModel('复制', Icons.content_copy),
    ItemModel('转发', Icons.send),
    ItemModel('收藏', Icons.collections),
    ItemModel('删除', Icons.delete),
    ItemModel('多选', Icons.playlist_add_check),
    ItemModel('引用', Icons.format_quote),
    ItemModel('提醒', Icons.add_alert),
    ItemModel('搜一搜', Icons.search),
  ];

  Widget _buildLongPressMenu() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 220,
        color: const Color(0xFF4C4C4C),
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          crossAxisCount: 5,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: menuItems
              .map((item) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        size: 20,
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Text(
                          item.title,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildAvatar(bool isMe, double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: isMe ? Colors.blueAccent : Colors.pinkAccent,
        width: size,
        height: size,
        child: Icon(
          isMe ? Icons.face : Icons.tag_faces,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = message.isMe;
    double avatarSize = 40;

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: isMe ? 0 : 10, left: isMe ? 10 : 0),
            child: CustomPopupMenu(
              child: _buildAvatar(isMe, avatarSize),
              menuBuilder: () => GestureDetector(
                child: _buildAvatar(isMe, 100),
                onLongPress: () {
                  print("onLongPress");
                },
                onTap: () {
                  print("onTap");
                },
              ),
              barrierColor: Colors.transparent,
              pressType: PressType.singleClick,
              arrowColor: isMe ? Colors.blueAccent : Colors.pinkAccent,
              position: PreferredPosition.top,
            ),
          ),
          CustomPopupMenu(
            child: Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 240, minHeight: avatarSize),
              decoration: BoxDecoration(
                color: isMe ? Color(0xff98e165) : Colors.white,
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Text(message.content),
            ),
            menuBuilder: _buildLongPressMenu,
            barrierColor: Colors.transparent,
            pressType: PressType.longPress,
          )
        ],
      ),
    );
  }
}
