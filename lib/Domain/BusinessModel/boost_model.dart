// To parse this JSON data, do
//
//     final boostModel = boostModelFromJson(jsonString);

import 'dart:convert';

BoostModel boostModelFromJson(String str) =>
    BoostModel.fromJson(json.decode(str));

String boostModelToJson(BoostModel data) => json.encode(data.toJson());

class BoostModel {
  final String? id;
  final String? title;
  final int? price;
  final String? duration;
  final int? daysInNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  BoostModel({
    this.id,
    this.title,
    this.price,
    this.duration,
    this.daysInNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  BoostModel copyWith({
    String? id,
    String? title,
    int? price,
    String? duration,
    int? daysInNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      BoostModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        duration: duration ?? this.duration,
        daysInNumber: daysInNumber ?? this.daysInNumber,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory BoostModel.fromJson(Map<String, dynamic> json) => BoostModel(
        id: json["_id"],
        title: json["title"],
        price: json["price"],
        duration: json["duration"],
        daysInNumber: json["daysInNumber"],
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
        "duration": duration,
        "daysInNumber": daysInNumber,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
