import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/community/models/mock_found.dart';
import 'package:flutter_hello/ui/theme.dart';
import 'package:flutter_hello/utils/utils.dart';

class FoundCell extends StatelessWidget {
  final MockFound data;
  const FoundCell({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: double.infinity,
          child: Utils.imageCache(data.cardUrl),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(children: [
                Text(
                  data.content,
                  maxLines: 2,
                )
              ]),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Utils.imageCache(data.avatarUrl),
                      // child: Image(image: NetworkImage(data.cardUrl)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      data.nickname,
                      style:
                          TextStyle(color: KKTheme.placeholder, fontSize: 10),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_border_outlined,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('${data.likes}'),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
