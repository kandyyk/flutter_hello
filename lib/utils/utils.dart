library utils;

import 'dart:convert';
import 'dart:ui' as ui show window;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hello/http/network.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'screen_util.dart';
part 'storage_util.dart';

const assetHost = 'https://rao.pics/r';

class Utils {
  static toast(String text) async {
    await EasyLoading.showToast(text);
  }

  static loading(String? text) async {
    await EasyLoading.show(status: text ?? 'loading');
  }

  static dismiss() {
    EasyLoading.dismiss();
  }

  static Widget imageCache(String url,
      {BoxFit? fit, bool showPlaceholder = true}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.fitWidth,
      placeholder: (context, url) => showPlaceholder
          ? const CupertinoActivityIndicator(
              color: Colors.grey,
            )
          : Container(),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }

  static String getRandomImage() {
    String url = '$assetHost?t=${mock.integer(max: 10)}';
    return url;
  }

//加圆角背景
  static Widget decorate({Widget? child}) {
    if (child == null) {
      return Container();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.black12,
        child: child,
      ),
    );
  }

  static replacePictureURL(String path) {
    String tempURL = HttpClient.baseURL + path;
    return tempURL.replaceAll("\\", "/");
  }
}
