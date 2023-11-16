import 'dart:convert';

class BusinessBrokerProfile {
  final String? name;
  final String? image;
  final List<String>? businessCategories;
  final double? rating;

  BusinessBrokerProfile({
    this.name,
    this.image,
    this.businessCategories,
    this.rating,
  });

  factory BusinessBrokerProfile.fromRawJson(String str) => BusinessBrokerProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessBrokerProfile.fromJson(Map<String, dynamic> json) => BusinessBrokerProfile(
    name: json["name"],
    image: json["image"],
    businessCategories: json["buisnesscategories"] == null ? [] : List<String>.from(json["buisnesscategories"]!.map((x) => x)),
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "buisnesscategories": businessCategories == null ? [] : List<dynamic>.from(businessCategories!.map((x) => x)),
    "rating": rating,
  };
}
