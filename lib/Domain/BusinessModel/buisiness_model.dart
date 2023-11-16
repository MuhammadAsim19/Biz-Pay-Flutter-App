import 'dart:convert';

class BusinessProductModel {
  final String? businessName;
  final String? businessDescription;
  final String? price;
  final String? location;
  final String? businessImage;
  final bool? isFav;

  BusinessProductModel({
    this.businessName,
    this.businessDescription,
    this.price,
    this.location,
    this.businessImage,
    this.isFav,
  });

  factory BusinessProductModel.fromRawJson(String str) => BusinessProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessProductModel.fromJson(Map<String, dynamic> json) => BusinessProductModel(
    businessName: json["businessName"],
    businessDescription: json["businessDescription"],
    price: json["price"],
    location: json["location"],
    businessImage: json["businessImage"],
    isFav: json["isFav"],
  );

  Map<String, dynamic> toJson() => {
    "businessName": businessName,
    "businessDescription": businessDescription,
    "price": price,
    "location": location,
    "businessImage": businessImage,
    "isFav": isFav,
  };
}
