import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_hello/utils/utils.dart';

class MockComment {
  final String name;
  final String comment;
  final String? replyer;

  MockComment(
      {required this.name, required this.comment, required this.replyer});

  static List<MockComment> get() {
    return List.generate(
        mock.integer(max: 9),
        (index) => MockComment(
            name: mock.cname(),
            replyer: mock.integer(max: 2) == 0 ? mock.cname() : null,
            comment: mock.csentence(min: 5, max: 30)));
  }
}

class MockFriend {
  final String nickname;
  final String avatarUrl;
  final String content;
  final List<String> images;
  final String time;
  final List<String> likePeople;
  final List<MockComment> comments;

  MockFriend({
    required this.nickname,
    required this.avatarUrl,
    required this.content,
    required this.images,
    required this.time,
    required this.likePeople,
    required this.comments,
  });

  static final List<MockFriend> _dataList = [];

  static List<MockFriend> get() {
    for (var i = 0; i < 20; i++) {
      List<String> imgs = [];
      List<String> likePeople = [];
      for (var j = 0; j < mock.integer(max: 9); j++) {
        imgs.add(Utils.getRandomImage());
        likePeople.add(mock.cname());
      }
      _dataList.add(MockFriend(
        nickname: mock.cname(),
        avatarUrl: Utils.getRandomImage(),
        content: mock.cword(min: 20, max: 100),
        images: imgs,
        time: '${mock.dateTime().hour}小时前',
        likePeople: likePeople,
        comments: MockComment.get(),
      ));
    }
    return _dataList;
  }

  static clear() {
    _dataList.clear();
  }
}
