import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/models/mock_friend.dart';
import 'package:flutter_hello/pages/community/views/friend_grid_image.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:flutter_hello/ui/theme.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:get/get.dart';

class FriendCell extends StatefulWidget {
  final MockFriend data;
  const FriendCell({super.key, required this.data});

  @override
  State<FriendCell> createState() => _FriendCellState();
}

class _FriendCellState extends State<FriendCell> {
  @override
  Widget build(BuildContext context) {
    var iconW = (MediaQuery.of(context).size.width - 59) / 3;
    int n = widget.data.images.length ~/ 3;
    double height = iconW * (n + (widget.data.images.length % 3 == 0 ? 0 : 1));
    double maxH = widget.data.images.length == 1 ? 250 : height;

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 3, 5, 0),
            child: InkWell(
              onTap: () =>
                  Get.toNamed(PageName.personDetail, arguments: widget.data),
              child: SizedBox(
                width: 24,
                height: 24,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Utils.imageCache(widget.data.avatarUrl,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.nickname,
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: KKTheme.primaryFocus),
              ),
              Text(
                widget.data.content,
                maxLines: 3,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                constraints: BoxConstraints(
                  maxHeight: maxH,
                ),
                child: FriendGridImageView(imageUrls: widget.data.images),
              ),
              Row(
                children: [
                  Text(widget.data.time),
                  const Spacer(),
                  SizedBox(
                    width: 31,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more, size: 22)),
                  )
                ],
              ),
              Utils.decorate(
                  child: widget.data.comments.isEmpty
                      ? null
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.data.comments
                              .map((e) => commentView(e))
                              .toList(),
                        )),
            ],
          ))
        ],
      ),
    );
  }

  Widget commentView(MockComment c) {
    var list = [
      TextSpan(
          text: '${c.name}: ',
          style: TextStyle(color: KKTheme.primaryFocus, fontSize: 14),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Utils.toast('点击了${c.name}');
            }),
      TextSpan(text: c.comment, style: KKTheme.detailText)
    ];
    if (c.replyer != null && list.length > 1) {
      list.insert(
          0,
          TextSpan(
              text: c.replyer,
              style: TextStyle(color: KKTheme.primaryFocus, fontSize: 14),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Utils.toast('点击了${c.replyer}');
                }));
      list.insert(1, TextSpan(text: '回复', style: KKTheme.detailText));
    }
    return RichText(text: TextSpan(children: list));
  }
}
