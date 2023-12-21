import 'dart:convert';

class ChatDetailModel {
  final String? username;
  final String? profilePic;
  final String? businessTitle;
  final String? id;
  final List<DetailMessage>? messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? lastMessage;

  ChatDetailModel({
    this.username,
    this.profilePic,
    this.businessTitle,
    this.id,
    this.messages,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMessage,
  });

  factory ChatDetailModel.fromRawJson(String str) => ChatDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatDetailModel.fromJson(Map<String, dynamic> json) => ChatDetailModel(
    username: json["username"],
    profilePic: json["profilePic"],
    businessTitle: json["businessTitle"],
    id: json["_id"],
    messages: json["messages"] == null ? [] : List<DetailMessage>.from(json["messages"]!.map((x) => DetailMessage.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    lastMessage: json["lastMessage"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "profilePic": profilePic,
    "businessTitle": businessTitle,
    "_id": id,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "lastMessage": lastMessage,
  };
}

class DetailMessage {
  final String? id;
  final String? sender;
  final String? receiver;
  final List<dynamic>? images;
  final List<dynamic>? videos;
  final List<dynamic>? docs;
  final List<dynamic>? audios;
  final String? content;
  final bool? isRead;
  final DateTime? createdAt;
  final int? v;

  DetailMessage({
    this.id,
    this.sender,
    this.receiver,
    this.images,
    this.videos,
    this.docs,
    this.audios,
    this.content,
    this.isRead,
    this.createdAt,
    this.v,
  });

  factory DetailMessage.fromRawJson(String str) => DetailMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailMessage.fromJson(Map<String, dynamic> json) => DetailMessage(
    id: json["_id"],
    sender: json["sender"],
    receiver: json["receiver"],
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
    docs: json["docs"] == null ? [] : List<dynamic>.from(json["docs"]!.map((x) => x)),
    audios: json["audios"] == null ? [] : List<dynamic>.from(json["audios"]!.map((x) => x)),
    content: json["content"],
    isRead: json["isRead"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sender": sender,
    "receiver": receiver,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
    "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x)),
    "audios": audios == null ? [] : List<dynamic>.from(audios!.map((x) => x)),
    "content": content,
    "isRead": isRead,
    "createdAt": createdAt?.toIso8601String(),
    "__v": v,
  };
}
