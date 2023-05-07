import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/store/controllers/search_controller.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SearchPage')),
        body: SafeArea(child: Text('SearchController')));
  }
}
