import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hello/constants.dart';
import 'package:flutter_hello/http/network.dart';
import 'package:flutter_hello/pages/store/models/category_model.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  StoreController();

  RxBool hideTralling = false.obs;

  RxList<Category> leftCategoryList = <Category>[].obs;
  RxList<Category> rightCategoryList = <Category>[].obs;
  Map<String, List<Category>?> _rightMap = {};

  RxInt selectedIndex = 0.obs;

  // var leftList =
  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInit');
    loadData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void loadData() async {
    var json =
        await HttpClient().request(Api.mainCategory, method: DioMethod.get);
    // var json = await HttpClient().get(Api.mainCategory);
    var data = CategoryModel.fromJson(json).result;
    if (data == null) {
      debugPrint('leftCategoryList is null');
      return;
    }
    leftCategoryList.value = data;
    loadRightData(data[0].sId!);
    update();
  }

  void loadRightData(String id) async {
    var json = await HttpClient().get(Api.secondCategory + id);
    var data = CategoryModel.fromJson(json).result;
    if (data == null) {
      debugPrint('rightCategoryList is null');
      return;
    }
    rightCategoryList.value = data;
    //缓存
    _rightMap[id] = data;
    update();
  }

  void select(int index) {
    selectedIndex.value = index;
    String? sid = leftCategoryList[index].sId;
    if (sid == null) {
      return;
    }
    //先从本地获取
    if (_rightMap[sid] != null) {
      rightCategoryList.value = _rightMap[sid]!;
      update();
      return;
    }

    loadRightData(sid);
    update();
  }
}

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController());
  }
}
