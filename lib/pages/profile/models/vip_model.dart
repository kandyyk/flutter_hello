import 'dart:convert';

class VipModel {
  List<Vip>? vip;

  VipModel({this.vip});

  VipModel.fromJson(Map<String, dynamic> json) {
    if (json['Vip'] != null) {
      vip = <Vip>[];
      json['Vip'].forEach((v) {
        vip!.add(new Vip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vip != null) {
      data['Vip'] = this.vip!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<Vip> mock() {
    return VipModel.fromJson(json.decode(vipJsonString)).vip!;
  }
}

class Vip {
  String? title;
  String? detail;

  Vip({this.title, this.detail});

  Vip.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['detail'] = this.detail;
    return data;
  }
}

const vipJsonString = ''' {
    "Vip": [
        {
            "title": "视屏VIP",
            "detail": "2024-05-08"
        },
        {
            "title": "体育VIP",
            "detail": "新人首月15元"
        },
        {
            "title": "免费VIP",
            "detail": "最高领22天"
        },
        {
            "title": "我的额度",
            "detail": "查额送VIP"
        },
        {
            "title": "我的等级",
            "detail": "享V6特权"
        },
        {
            "title": "我的积分",
            "detail": "余额1380积分"
        },
        {
            "title": "我的钻石",
            "detail": "余额2钻"
        }
    ]
} ''';
