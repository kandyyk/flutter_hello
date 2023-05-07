import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/views/friend_cell.dart';
import 'package:flutter_hello/pages/community/models/mock_friend.dart';

class RecommendPageView extends StatefulWidget {
  const RecommendPageView({super.key});

  @override
  State<RecommendPageView> createState() => _RecommendState();
}

class _RecommendState extends State<RecommendPageView> {
  final List<MockFriend> _dataList = MockFriend.get();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          return FriendCell(data: _dataList[index]);
        });
  }
}
