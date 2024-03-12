import 'dart:convert';

BadgeModel badgeModelFromJson(String str) =>
    BadgeModel.fromJson(json.decode(str));

String badgeModelToJson(BadgeModel data) => json.encode(data.toJson());

class BadgeModel {
  final String? id;
  final String? title;
  final int? price;
  final String? paymentType;
  final String? type;
  final bool? alreadyRequested;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  BadgeModel({
    this.id,
    this.title,
    this.price,
    this.paymentType,
    this.type,
    this.alreadyRequested,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  BadgeModel copyWith({
    String? id,
    String? title,
    int? price,
    bool? alreadyRequested,
    String? paymentType,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      BadgeModel(
        alreadyRequested: alreadyRequested ?? this.alreadyRequested,
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        paymentType: paymentType ?? this.paymentType,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory BadgeModel.fromJson(Map<String, dynamic> json) => BadgeModel(
        alreadyRequested: json['alreadyRequested'],
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
        "alreadyRequested": alreadyRequested,
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
