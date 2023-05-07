import 'package:flutter_hello/pages/community/community.dart';
import 'package:flutter_hello/pages/home/home.dart';
import 'package:flutter_hello/pages/login/controllers/forgot_password_controller.dart';
import 'package:flutter_hello/pages/login/forgot_password.dart';
import 'package:flutter_hello/pages/login/login.dart';
import 'package:flutter_hello/pages/message/message.dart';
import 'package:flutter_hello/pages/profile/controllers/profile_controller.dart';
import 'package:flutter_hello/pages/profile/profile.dart';
import 'package:flutter_hello/pages/store/controllers/search_controller.dart';
import 'package:flutter_hello/pages/store/controllers/store_controller.dart';
import 'package:flutter_hello/pages/store/search.dart';
import 'package:flutter_hello/pages/store/store.dart';
import 'package:flutter_hello/pages/tabs/controllers/tabs_controller.dart';
import 'package:flutter_hello/pages/tabs/tabs_view.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:get/get.dart';

// part of './pages.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const CADASTRO = '/cadastro';
}

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: PageName.tabs, page: () => TabsPage(), binding: TabsBinding()),
  GetPage(name: PageName.home, page: () => HomePage()),
  GetPage(
    name: PageName.store,
    page: () => StorePage(),
    binding: StoreBinding(),
  ),
  GetPage(
      name: PageName.search,
      page: () => SearchPage(),
      binding: SearchBinding()),
  GetPage(name: PageName.community, page: () => CommunityPage()),
  GetPage(name: PageName.message, page: () => const MessagePage()),
  GetPage(
      name: PageName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding()),
  GetPage(name: PageName.login, page: () => LoginPage()),
  GetPage(
      name: PageName.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding()),
];
