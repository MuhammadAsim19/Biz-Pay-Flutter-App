import 'dart:convert';

class NotificationModel {
  final String? id;
  final String? clickAction;
  final String? message;
  final dynamic createdBy;
  final CreatedFor? createdFor;
  final bool? isRead;
  final String? type;
  final String? icon;
  final dynamic info;
  final dynamic businessConversation;
  final dynamic category;
  final dynamic subCategory;
  final dynamic childSubCategory;
  final dynamic business;
  final dynamic notifyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationModel({
    this.id,
    this.message,
    this.createdBy,
    this.createdFor,
    this.isRead,
    this.type,
    this.icon,
    this.info,
    this.businessConversation,
    this.category,
    this.subCategory,
    this.childSubCategory,
    this.clickAction,
    this.business,
    this.notifyId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        clickAction: json['click_action'] ?? "",
        id: json["_id"],
        message: json["message"],
        createdBy: json["createdBy"],
        createdFor: json["createdFor"] == null
            ? null
            : CreatedFor.fromJson(json["createdFor"]),
        isRead: json["isRead"],
        type: json["type"],
        icon: json["icon"],
        info: json["info"],
        businessConversation: json["BusinessConversation"],
        category: json["category"],
        subCategory: json["subCategory"],
        childSubCategory: json["childSubCategory"],
        business: json["business"],
        notifyId: json["notifyId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "click_action": clickAction,
        "_id": id,
        "message": message,
        "createdBy": createdBy,
        "createdFor": createdFor?.toJson(),
        "isRead": isRead,
        "type": type,
        "icon": icon,
        "info": info,
        "BusinessConversation": businessConversation,
        "category": category,
        "subCategory": subCategory,
        "childSubCategory": childSubCategory,
        "business": business,
        "notifyId": notifyId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CreatedFor {
  final String? id;
  final String? fullName;
  final String? email;

  CreatedFor({
    this.id,
    this.fullName,
    this.email,
  });

  factory CreatedFor.fromRawJson(String str) =>
      CreatedFor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedFor.fromJson(Map<String, dynamic> json) => CreatedFor(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
      };
}
