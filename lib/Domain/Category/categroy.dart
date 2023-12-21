import 'dart:convert';

class Category {
  final String? id;
  final String? title;
  final String? icon;
  final String? backgroundcolor;
  final List<SubCategory>? subCategories;

  Category({
    this.id,
    this.title,
    this.icon,
    this.backgroundcolor,
    this.subCategories,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        icon: json["icon"],
        backgroundcolor: json["backgroundcolor"],
        subCategories: json["subCategories"] == null
            ? []
            : List<SubCategory>.from(
                json["subCategories"]!.map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "icon": icon,
        "backgroundcolor": backgroundcolor,
        "subCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class SubCategory {
  final String? id;
  final String? title;
  final String? category;
  final String? icon;
  final String? backgroundcolor;
  final List<dynamic>? childSubCategories;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  SubCategory({
    this.id,
    this.title,
    this.category,
    this.icon,
    this.backgroundcolor,
    this.childSubCategories,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SubCategory.fromRawJson(String str) =>
      SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["_id"],
        title: json["title"],
        category: json["category"],
        icon: json["icon"],
        backgroundcolor: json["backgroundcolor"],
        childSubCategories: json["childSubCategories"] == null
            ? []
            : List<dynamic>.from(json["childSubCategories"]!.map((x) => x)),
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
        "category": category,
        "icon": icon,
        "backgroundcolor": backgroundcolor,
        "childSubCategories": childSubCategories == null
            ? []
            : List<dynamic>.from(childSubCategories!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
