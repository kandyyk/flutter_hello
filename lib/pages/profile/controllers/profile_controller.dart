import 'package:flutter/material.dart';
import 'package:flutter_hello/constants.dart';
import 'package:flutter_hello/pages/profile/models/vip_model.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:get/get.dart';
import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  //avatar UI
  static const avatarPadding = 15;
  static const move = 50;
  final topMax = safeTop + avatarPadding + move;

  final topDefault = safeTop + avatarPadding;
  final infoLeft = 80;

  double avatarSizeDefault = 30;
  double avatarSize = 50;
  double avatarTop = safeTop + avatarPadding + move;
  double avatarLeft = 16;

  //head list
  final List<Vip> vipList = VipModel.mock();

  final List<Map> creationList = [
    {'id': 0, 'icon': Icons.home_outlined, 'title': '创作首页'},
    {'id': 0, 'icon': Icons.image_outlined, 'title': '素材库'},
    {'id': 0, 'icon': Icons.list_alt, 'title': '作品管理'},
    {'id': 0, 'icon': Icons.card_giftcard, 'title': '活动'}
  ];

  final List<String> notifications = List.generate(
      mock.integer(min: 3, max: 5), (index) => mock.ctitle(min: 6, max: 20));

  var scaffoldKey = GlobalKey<ScaffoldState>();

//图片选择器
  final ImagePicker imagePicker = ImagePicker();
  RxBool haveAvatarPath = false.obs;
  RxString avatarPath = ''.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      double offset = scrollController.offset;

      if (offset > move) {
        avatarSize = avatarSizeDefault;
        avatarTop = statusH + avatarPadding;
        update();
        return;
      }
      double rate = 1 - offset / move;
      avatarSize = avatarSizeDefault + 20 * rate;
      avatarTop = topMax - offset;
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    update();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
    update();
  }

  void openImagePicker() async {
    // Pick an image.
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Storage.setData(StoragePath.profileAvatar, image.path);
      avatarPath.value = image.path;
      update();
    }
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
