import 'dart:convert';

class ChatTileModel {
  final String? id;
  final String? message;
  final dynamic createdBy;
  final String? createdFor;
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

  ChatTileModel({
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
    this.business,
    this.notifyId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ChatTileModel.fromRawJson(String str) =>
      ChatTileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatTileModel.fromJson(Map<String, dynamic> json) => ChatTileModel(
        id: json["_id"],
        message: json["message"],
        createdBy: json["createdBy"],
        createdFor: json["createdFor"],
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
        "_id": id,
        "message": message,
        "createdBy": createdBy,
        "createdFor": createdFor,
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
