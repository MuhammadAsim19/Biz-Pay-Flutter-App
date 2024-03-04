import 'dart:convert';

class AppBadgesModel {
  final String? id;
  final String? title;
  final int? price;
  final String? paymentType;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  AppBadgesModel({
    this.id,
    this.title,
    this.price,
    this.paymentType,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AppBadgesModel.fromRawJson(String str) =>
      AppBadgesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppBadgesModel.fromJson(Map<String, dynamic> json) => AppBadgesModel(
        id: json["_id"],
        title: json["title"],
        price: json["price"],
        paymentType: json["paymentType"],
        type: json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "price": price,
        "paymentType": paymentType,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
