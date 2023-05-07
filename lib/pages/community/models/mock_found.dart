import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_hello/utils/utils.dart';

class MockFound {
  final String nickname;
  final String avatarUrl;
  final String cardUrl;
  final String content;
  final int likes;

  MockFound({
    required this.nickname,
    required this.avatarUrl,
    required this.cardUrl,
    required this.content,
    required this.likes,
  });

  static final List<MockFound> _dataList = [];
  static List<MockFound> get() {
    for (var i = 0; i < 30; i++) {
      _dataList.add(MockFound(
        nickname: mock.cname(),
        avatarUrl: Utils.getRandomImage(),
        cardUrl: Utils.getRandomImage(),
        content: mock.cword(min: 15, max: 20),
        likes: mock.integer(max: 100),
      ));
    }
    return _dataList;
  }

  static clear() {
    _dataList.clear();
  }
}
