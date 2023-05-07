import 'views/found_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/models/mock_found.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FoundPageView extends StatefulWidget {
  const FoundPageView({super.key});

  @override
  State<FoundPageView> createState() => _FoundPageViewState();
}

class _FoundPageViewState extends State<FoundPageView> {
  final List<MockFound> _dataList = MockFound.get();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: masonry(),
    );
  }

  Widget masonry() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: MasonryGridView.count(
        shrinkWrap: true, //内容收缩
        physics: const NeverScrollableScrollPhysics(), //禁止滚动，通过上层scrollview滚动
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        itemCount: _dataList.length,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return FoundCell(
            data: _dataList[index],
          );
        },
      ),
    );
  }
}
