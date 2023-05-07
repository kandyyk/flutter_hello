import 'package:flutter/material.dart';
import 'package:flutter_hello/utils/utils.dart';

const friendIconOneW = 100.0;
const friendIconW = 60.0;

class FriendGridImageView extends StatelessWidget {
  final List<String> imageUrls;
  const FriendGridImageView({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return Container();
    }

    if (imageUrls.length == 1) {
      return SizedBox(
        width: 150,
        child: Utils.imageCache(imageUrls.first, fit: BoxFit.fitWidth),
      );
    }

    return GridView.count(
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: imageUrls
          .map((url) => SizedBox(
                width: friendIconW,
                child: Utils.imageCache(url, fit: BoxFit.cover),
              ))
          .toList(),
    );
  }
}
