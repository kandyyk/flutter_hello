import 'package:flutter/material.dart';

class ChatModel {
  String content;
  bool isMe;

  ChatModel(this.content, {this.isMe = false});
}

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}
