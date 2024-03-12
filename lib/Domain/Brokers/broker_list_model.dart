import 'dart:convert';

class BrokersListModel {
  final ServingArea? servingArea;
  final Experties? experties;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accountStatus;
  final String? experience;
  final List<String>? certificates;
  final List<ExpertBadgeModel>? badges;
  final String? description;
  final String? website;
  final String? designation;
  final UserInfo? userInfo;
  final List<IndustriesServed>? industriesServed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  BrokersListModel({
    this.servingArea,
    this.experties,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accountStatus,
    this.experience,
    this.certificates,
    this.description,
    this.website,
    this.designation,
    this.userInfo,
    this.industriesServed,
    this.badges,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BrokersListModel.fromRawJson(String str) =>
      BrokersListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrokersListModel.fromJson(Map<String, dynamic> json) =>
      BrokersListModel(
        badges: json['badges'] != null
            ? List.from(json['badges'].map((e) => ExpertBadgeModel.fromJson(e)))
            : [],
        servingArea: json["servingArea"] == null
            ? null
            : ServingArea.fromJson(json["servingArea"]),
        experties: json["experties"] == null
            ? null
            : Experties.fromJson(json["experties"]),
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        accountStatus: json["accountStatus"],
        experience: json["experience"],
        certificates: json["educationAndCertification"] == null
            ? []
            : List<String>.from(
                json["educationAndCertification"]!.map((x) => x)),
        description: json["description"],
        website: json["website"],
        designation: json["designation"],
        userInfo: json["userInfo"] == null
            ? null
            : UserInfo.fromJson(json["userInfo"]),
        industriesServed: json["industries_served"] == null
            ? []
            : List<IndustriesServed>.from(json["industries_served"]!
                .map((x) => IndustriesServed.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "badges":
            badges == null ? [] : List<dynamic>.from(badges!.map((x) => x)),
        "servingArea": servingArea?.toJson(),
        "experties": experties?.toJson(),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "accountStatus": accountStatus,
        "experience": experience,
        "educationAndCertification": certificates == null
            ? []
            : List<dynamic>.from(certificates!.map((x) => x)),
        "description": description,
        "website": website,
        "designation": designation,
        "userInfo": userInfo?.toJson(),
        "industries_served": industriesServed == null
            ? []
            : List<dynamic>.from(industriesServed!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Experties {
  final String? profession;
  final int? yearOfExperience;
  final List<String>? servicesOffered;

  Experties({
    this.profession,
    this.yearOfExperience,
    this.servicesOffered,
  });

  factory Experties.fromRawJson(String str) =>
      Experties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Experties.fromJson(Map<String, dynamic> json) => Experties(
        profession: json["profession"],
        yearOfExperience: json["yearOfExperience"],
        servicesOffered: json["services_offered"] == null
            ? []
            : List<String>.from(json["services_offered"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "profession": profession,
        "yearOfExperience": yearOfExperience,
        "services_offered": servicesOffered == null
            ? []
            : List<dynamic>.from(servicesOffered!.map((x) => x)),
      };
}

class IndustriesServed {
  final String? id;
  final String? title;
  final String? icon;
  final String? backgroundcolor;
  final List<String>? subCategories;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  IndustriesServed({
    this.id,
    this.title,
    this.icon,
    this.backgroundcolor,
    this.subCategories,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory IndustriesServed.fromRawJson(String str) =>
      IndustriesServed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndustriesServed.fromJson(Map<String, dynamic> json) =>
      IndustriesServed(
        id: json["_id"],
        title: json["title"],
        icon: json["icon"],
        backgroundcolor: json["backgroundcolor"],
        subCategories: json["subCategories"] == null
            ? []
            : List<String>.from(json["subCategories"]!.map((x) => x)),
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
        "icon": icon,
        "backgroundcolor": backgroundcolor,
        "subCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class ServingArea {
  final String? country;
  final String? state;
  final String? city;
  final String? zipcode;

  ServingArea({
    this.country,
    this.state,
    this.city,
    this.zipcode,
  });

  factory ServingArea.fromRawJson(String str) =>
      ServingArea.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServingArea.fromJson(Map<String, dynamic> json) => ServingArea(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "zipcode": zipcode,
      };
}

ExpertBadgeModel badgeModelFromJson(String str) =>
    ExpertBadgeModel.fromJson(json.decode(str));

String badgeModelToJson(ExpertBadgeModel data) => json.encode(data.toJson());

class ExpertBadgeModel {
  final String? id;
  final String? title;
  final int? price;
  final String? paymentType;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ExpertBadgeModel({
    this.id,
    this.title,
    this.price,
    this.paymentType,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ExpertBadgeModel copyWith({
    String? id,
    String? title,
    int? price,
    String? paymentType,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      ExpertBadgeModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        paymentType: paymentType ?? this.paymentType,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory ExpertBadgeModel.fromJson(Map<String, dynamic> json) =>
      ExpertBadgeModel(
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

class UserInfo {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? profilePic;
  final String? registerationMethod;
  final String? accountStatus;
  final bool? agreedToPolicies;
  final bool? onlineStatus;
  final bool? isActive;
  final bool? isVerified;
  final String? role;
  final List<String>? businesses;
  final List<dynamic>? businessesWishlist;
  final List<dynamic>? recentlyViewedBusiness;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? forgetPasswordOtp;
  final DateTime? resetPasswordExpires;
  final DateTime? resetPasswordGeneratedAt;
  final String? resetPasswordToken;
  final String? agreedToPolicyVersion;

  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.phone,
    this.profilePic,
    this.registerationMethod,
    this.accountStatus,
    this.agreedToPolicies,
    this.onlineStatus,
    this.isActive,
    this.isVerified,
    this.role,
    this.businesses,
    this.businessesWishlist,
    this.recentlyViewedBusiness,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.forgetPasswordOtp,
    this.resetPasswordExpires,
    this.resetPasswordGeneratedAt,
    this.resetPasswordToken,
    this.agreedToPolicyVersion,
  });

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        profilePic: json["profilePic"],
        registerationMethod: json["registerationMethod"],
        accountStatus: json["accountStatus"],
        agreedToPolicies: json["agreed_to_policies"],
        onlineStatus: json["onlineStatus"],
        isActive: json["isActive"],
        isVerified: json["isVerified"],
        role: json["role"],
        businesses: json["businesses"] == null
            ? []
            : List<String>.from(json["businesses"]!.map((x) => x)),
        businessesWishlist: json["businesses_wishlist"] == null
            ? []
            : List<dynamic>.from(json["businesses_wishlist"]!.map((x) => x)),
        recentlyViewedBusiness: json["recentlyViewed_Business"] == null
            ? []
            : List<dynamic>.from(
                json["recentlyViewed_Business"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        forgetPasswordOtp: json["forgetPasswordOTP"],
        resetPasswordExpires: json["resetPasswordExpires"] == null
            ? null
            : DateTime.parse(json["resetPasswordExpires"]),
        resetPasswordGeneratedAt: json["resetPasswordGeneratedAt"] == null
            ? null
            : DateTime.parse(json["resetPasswordGeneratedAt"]),
        resetPasswordToken: json["resetPasswordToken"],
        agreedToPolicyVersion: json["agreed_to_policy_version"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "profilePic": profilePic,
        "registerationMethod": registerationMethod,
        "accountStatus": accountStatus,
        "agreed_to_policies": agreedToPolicies,
        "onlineStatus": onlineStatus,
        "isActive": isActive,
        "isVerified": isVerified,
        "role": role,
        "businesses": businesses == null
            ? []
            : List<dynamic>.from(businesses!.map((x) => x)),
        "businesses_wishlist": businessesWishlist == null
            ? []
            : List<dynamic>.from(businessesWishlist!.map((x) => x)),
        "recentlyViewed_Business": recentlyViewedBusiness == null
            ? []
            : List<dynamic>.from(recentlyViewedBusiness!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "forgetPasswordOTP": forgetPasswordOtp,
        "resetPasswordExpires": resetPasswordExpires?.toIso8601String(),
        "resetPasswordGeneratedAt": resetPasswordGeneratedAt?.toIso8601String(),
        "resetPasswordToken": resetPasswordToken,
        "agreed_to_policy_version": agreedToPolicyVersion,
      };
}
