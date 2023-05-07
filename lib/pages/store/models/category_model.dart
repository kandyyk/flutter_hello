class CategoryModel {
  List<Category>? result;

  CategoryModel({this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Category>[];
      json['result'].forEach((v) {
        result!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (result != null) {
      data['goods'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? sId;
  String? title;
  int? status;
  String? pic;
  String? pid;
  int? sort;
  int? goProduct;
  String? productId;

  Category(
      {this.sId,
      this.title,
      this.status,
      this.pic,
      this.pid,
      this.sort,
      this.goProduct,
      this.productId});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    // sort = json['sort'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['pid'] = pid;
    // data['sort'] = sort;
    data['go_product'] = goProduct;
    data['product_id'] = productId;
    return data;
  }
}
