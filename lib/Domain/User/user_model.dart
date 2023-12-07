import 'dart:convert';

class UserModel {
  final String? token;
  final User? user;

  UserModel({
    this.token,
    this.user,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  final String? firstName;
  final String? fullName;
  final String? email;
  final String? accountStatus;
  final bool? agreedToPolicies;
  final bool? onlineStatus;
  final bool? isActive;
  final bool? isVerified;
  final String? role;
  final List<dynamic>? businesses;
  final List<dynamic>? businessesWishlist;
  final List<dynamic>? recentlyViewedBusiness;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  User({
    this.firstName,
    this.fullName,
    this.email,
    this.accountStatus,
    this.agreedToPolicies,
    this.onlineStatus,
    this.isActive,
    this.isVerified,
    this.role,
    this.businesses,
    this.businessesWishlist,
    this.recentlyViewedBusiness,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    fullName: json["fullName"],
    email: json["email"],
    accountStatus: json["accountStatus"],
    agreedToPolicies: json["agreed_to_policies"],
    onlineStatus: json["onlineStatus"],
    isActive: json["isActive"],
    isVerified: json["isVerified"],
    role: json["role"],
    businesses: json["businesses"] == null ? [] : List<dynamic>.from(json["businesses"]!.map((x) => x)),
    businessesWishlist: json["businesses_wishlist"] == null ? [] : List<dynamic>.from(json["businesses_wishlist"]!.map((x) => x)),
    recentlyViewedBusiness: json["recentlyViewed_Business"] == null ? [] : List<dynamic>.from(json["recentlyViewed_Business"]!.map((x) => x)),
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "fullName": fullName,
    "email": email,
    "accountStatus": accountStatus,
    "agreed_to_policies": agreedToPolicies,
    "onlineStatus": onlineStatus,
    "isActive": isActive,
    "isVerified": isVerified,
    "role": role,
    "businesses": businesses == null ? [] : List<dynamic>.from(businesses!.map((x) => x)),
    "businesses_wishlist": businessesWishlist == null ? [] : List<dynamic>.from(businessesWishlist!.map((x) => x)),
    "recentlyViewed_Business": recentlyViewedBusiness == null ? [] : List<dynamic>.from(recentlyViewedBusiness!.map((x) => x)),
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
