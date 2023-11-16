import 'dart:convert';

class CategoryDummy {
  final String? catPic;
  final String? catName;
  final int? backgroundColor;

  CategoryDummy( {
    this.catPic,
    this.catName,

    this.backgroundColor,
  });

  CategoryDummy copyWith({
    String? catpic,
    String? catname,
  }) =>
      CategoryDummy(
        catPic: catpic ?? catPic,
        catName: catname ?? catName,
      );

  factory CategoryDummy.fromRawJson(String str) => CategoryDummy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDummy.fromJson(Map<String, dynamic> json) => CategoryDummy(
    catPic: json["catPic"],
    catName: json["catName"],
  );

  Map<String, dynamic> toJson() => {
    "catPic": catPic,
    "catName": catName,
  };
}
