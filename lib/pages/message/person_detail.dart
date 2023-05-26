import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/models/mock_friend.dart';
import 'package:flutter_hello/pages/message/controllers.dart/person_detail_controller.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonDetailPage extends GetView<PersonDetailController> {
  PersonDetailPage({super.key});

  MockFriend friend = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appbar(),
        body: SafeArea(
            child: Column(
          children: [
            _header(),
            const Divider(indent: 16),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: const Text('设置备注和标签'),
              trailing: _arrowed(),
            ),
            const Divider(indent: 16),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: const Text('朋友权限'),
              trailing: _arrowed(),
            ),
            _greyView(),
            _friendsArea(),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: const Text('更多信息'),
              trailing: _arrowed(),
            ),
            _greyView(),
            _message(),
            const Divider(),
            _video(),
            const Divider(),
          ],
        )));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: SizedBox(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Utils.imageCache(friend.avatarUrl),
          ),
        ),
        title: Text(
          friend.nickname,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '微信号：${friend.wxID}',
          style: const TextStyle(color: Colors.black45),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      actions: [
        SizedBox(
          width: 60,
          child: InkWell(
            child: const Icon(Icons.more_horiz),
            onTap: () {},
          ),
        )
      ],
    );
  }

  Widget _message() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.blueGrey)),
        onPressed: () {
          Get.toNamed(PageName.chart);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.chat_bubble_outline),
            Text(
              '发消息',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _video() {
    return TextButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blueGrey)),
      onPressed: () {
        Get.toNamed(PageName.chart);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.videocam),
          Text(
            '音视屏通话',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _friendsArea() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '朋友圈',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 200.w,
            height: 50.w,
            child: Row(
              children: _friendImages(friend.images)
                  .map((e) => Container(
                        width: 45.w,
                        height: 45.w,
                        margin: const EdgeInsets.only(right: 5),
                        child: Utils.imageCache(e, fit: BoxFit.cover),
                      ))
                  .toList(),
            ),
          ),
          _arrowed()
        ],
      ),
    );
  }

  List<String> _friendImages(List<String> images) {
    List<String> list = [];
    if (images.length <= 4) {
      return images;
    }
    for (var i = 0; i < images.length; i++) {
      if (i < 4) {
        list.add(images[i]);
      }
    }
    return list;
  }

  Widget _arrowed() {
    return const Icon(
      Icons.arrow_forward_ios,
      size: 16,
      color: Colors.grey,
    );
  }

  Widget _greyView() {
    return Container(
      height: 8,
      color: Colors.grey[200],
    );
  }
}
