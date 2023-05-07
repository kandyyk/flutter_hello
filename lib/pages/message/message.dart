import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/recommend.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('朋友圈')),
      body: const RecommendPageView(),
    );
  }
}
