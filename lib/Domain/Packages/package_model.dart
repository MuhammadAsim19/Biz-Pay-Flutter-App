import 'dart:convert';

PackageModel packageModelFromJson(String str) =>
    PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  final String? id;
  final String? title;
  final double? price;
  final String? duration;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  PackageModel({
    this.id,
    this.title,
    this.price,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  PackageModel copyWith({
    String? id,
    String? title,
    double? price,
    String? duration,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      PackageModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        duration: duration ?? this.duration,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        id: json["_id"],
        title: json["title"],
        price: double.parse(json["price"].toString()),
        duration: json["duration"],
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
