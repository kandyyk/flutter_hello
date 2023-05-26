import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:flutter_hello/route/route.dart';
import 'package:flutter_hello/ui/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(ScreenUtilInit(
      designSize: const Size(375, 677),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'xxxx',
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                centerTitle: true,
                color: Colors.white,
                titleTextStyle: TextStyle(
                  color: KKTheme.base,
                  fontSize: KKTheme.fsXl,
                  fontWeight: FontWeight.w500,
                ),
                iconTheme: IconThemeData(
                  color: KKTheme.base,
                  size: KKTheme.fsXl,
                ),
              ),
              highlightColor: Colors.transparent, //去除水波纹
              splashColor: Colors.transparent), //去除水波纹
          initialRoute: PageName.tabs,
          getPages: getRoutes,
          builder: EasyLoading.init(),
          // initialRoute: PageName.login,
        );
      }));
}
