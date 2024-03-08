import 'dart:convert';

class BadgesRequest {
  final Payment? payment;
  final String? id;
  final Reff? userReff;
  final Reff? expertReff;
  final BusinessReff? businessReff;
  final BadgeReff? badgeReff;
  final int? amount;
  final String? message;
  final String? type;
  final String? attachment;
  final String? status;
  final int? v;
  final Delivery? delivery;

  BadgesRequest({
    this.payment,
    this.id,
    this.userReff,
    this.expertReff,
    this.businessReff,
    this.badgeReff,
    this.amount,
    this.message,
    this.type,
    this.attachment,
    this.status,
    this.v,
    this.delivery,
  });

  factory BadgesRequest.fromRawJson(String str) =>
      BadgesRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BadgesRequest.fromJson(Map<String, dynamic> json) => BadgesRequest(
      payment:
          json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      id: json["_id"],
      userReff:
          json["userReff"] == null ? null : Reff.fromJson(json["userReff"]),
      expertReff:
          json["expertReff"] == null ? null : Reff.fromJson(json["expertReff"]),
      businessReff: json["businessReff"] == null
          ? null
          : BusinessReff.fromJson(json["businessReff"]),
      badgeReff: json["badgeReff"] == null
          ? null
          : BadgeReff.fromJson(json["badgeReff"]),
      amount: json["amount"],
      message: json["message"],
      type: json["type"],
      attachment: json["attachment"],
      status: json["status"],
      v: json["__v"],
      delivery: json["delivery"] == null
          ? null
          : Delivery.fromJson(json["delivery"]));

  Map<String, dynamic> toJson() => {
        "payment": payment?.toJson(),
        "_id": id,
        "userReff": userReff?.toJson(),
        "expertReff": expertReff?.toJson(),
        "businessReff": businessReff?.toJson(),
        "badgeReff": badgeReff?.toJson(),
        "amount": amount,
        "message": message,
        "type": type,
        "attachment": attachment,
        "status": status,
        "__v": v,
      };
}

class BadgeReff {
  final String? id;
  final String? title;
  final int? price;
  final String? paymentType;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  BadgeReff({
    this.id,
    this.title,
    this.price,
    this.paymentType,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BadgeReff.fromRawJson(String str) =>
      BadgeReff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BadgeReff.fromJson(Map<String, dynamic> json) => BadgeReff(
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

class BusinessReff {
  final String? id;
  final String? name;

  BusinessReff({
    this.id,
    this.name,
  });

  factory BusinessReff.fromRawJson(String str) =>
      BusinessReff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessReff.fromJson(Map<String, dynamic> json) => BusinessReff(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class Reff {
  final String? id;
  final String? fullName;
  final String? profileImage;
  final String? email;
  final String? profilePic;

  Reff({
    this.id,
    this.fullName,
    this.profileImage,
    this.email,
    this.profilePic,
  });

  factory Reff.fromRawJson(String str) => Reff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reff.fromJson(Map<String, dynamic> json) => Reff(
        id: json["_id"],
        fullName: json["fullName"],
        profileImage: json["profileImage"],
        email: json["email"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "profileImage": profileImage,
        "email": email,
        "profilePic": profilePic,
      };
}

class Payment {
  final String? paymentIntentId;
  final int? amount;
  final String? status;

  Payment({
    this.paymentIntentId,
    this.amount,
    this.status,
  });

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentIntentId: json["paymentIntentId"],
        amount: json["amount"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "paymentIntentId": paymentIntentId,
        "amount": amount,
        "status": status,
      };
}

class Delivery {
  final String? message;
  final String? attachment;

  Delivery({this.message, this.attachment});

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        message: json["message"],
        attachment: json["attachment"],
      );
}
