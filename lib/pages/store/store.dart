import 'package:dart_mock/dart_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/store/controllers/store_controller.dart';
import 'package:flutter_hello/route/page_name.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StorePage extends GetView<StoreController> {
  var c = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    print('StorePage');
    return Scaffold(
        appBar: AppBar(
            title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            highlightColor: Colors.transparent, // 去除点击效果
            splashColor: Colors.transparent, // 去除点击效果
            onTap: () {
              Get.toNamed(PageName.search);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                const Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
                const SizedBox(width: 5),
                const Text(
                  '搜索',
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {}, child: const Icon(Icons.camera_alt_outlined)),
                const SizedBox(
                  width: 10,
                ),
                _tralling()
              ],
            ),
          ),
        )),
        body: Row(
          children: [
            _leftView(),
            _rightView(),
          ],
        ));
  }

  Widget _tralling() {
    return Obx(() => Row(
          children: controller.hideTralling.value
              ? []
              : [
                  Container(
                    width: 1,
                    height: 16,
                    color: Colors.black45,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () {}, child: const Icon(Icons.qr_code_outlined)),
                  const SizedBox(
                    width: 10,
                  ),
                ],
        ));
  }

  Widget _leftView() {
    return SizedBox(
      width: 80.w,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.leftCategoryList.length,
          itemBuilder: ((context, index) {
            return Obx(
              () => InkWell(
                onTap: () => controller.select(index),
                child: Container(
                  color: controller.selectedIndex.value == index
                      ? Colors.black12.withAlpha(5)
                      : Colors.white,
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        color: controller.selectedIndex.value == index
                            ? Colors.red
                            : Colors.transparent,
                        width: 5,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: Text(
                              '${controller.leftCategoryList[index].title}'))
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _rightView() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: controller.rightCategoryList
                .map((e) => InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Expanded(
                            //用Expanded包裹图片防止bottom overflow
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Utils.imageCache(
                                  Utils.replacePictureURL(e.pic ?? ''),
                                  fit: BoxFit.cover,
                                  showPlaceholder: false),
                            ),
                          ),
                          Text(e.title ?? '')
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
