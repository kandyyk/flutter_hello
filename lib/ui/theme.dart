import 'package:flutter/material.dart';

class KKTheme {
  /// 主题色
  static Color primary = const Color(0xff937DFF);

  /// 聚焦
  static Color primaryFocus = const Color.fromRGBO(102, 110, 232, 1);

  /// 文字主色
  static Color base = const Color(0xff323232);

  /// 次色
  static Color secondary = const Color(0xff949494);

  /// 辅助文字
  static Color placeholder = const Color(0xffcccccc);

  /// outline
  static Color outline = const Color(0xffe4e4e4);

  ///background
  static Color background = const Color(0xfff4f4f4);

  ///vip title
  static Color vipTitle = const Color(0xff95642a);

  ///vip detail
  static Color vipDetail = const Color(0xffbfa991);

  /// background color
  static Color bgColor = const Color.fromRGBO(242, 242, 242, .4);

  /// radius
  static BorderRadius radius = BorderRadius.circular(8);

  ///  fontSize 最小文字
  static double fsXs = 10;

  /// fontSize sm 次要文字
  static double fsSm = 12;

  /// fontSize base
  static double fsBase = 14;

  /// fontSize l 小标题
  static double fsL = 16;

  /// fontSize xl 标题
  static double fsXl = 18;

  static MaterialColor primarySwatch = Colors.blue;
  static MaterialColor primaryColor = Colors.blue;

  static TextStyle defaultText =
      const TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle detailText =
      const TextStyle(color: Colors.black87, fontSize: 14);
  static TextStyle boldText = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
}
