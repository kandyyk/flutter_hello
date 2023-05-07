part of utils;

const navH = 44.0;
const tabH = 49;

final screenW = ScreenUtil().screenWidth;
final screenH = ScreenUtil().screenHeight;

final safeTop = MediaQueryData.fromWindow(ui.window).padding.top;
final safeBottom = MediaQueryData.fromWindow(ui.window).padding.bottom;

final statusH = ScreenUtil().statusBarHeight;
final navContentH = statusH + navH;
