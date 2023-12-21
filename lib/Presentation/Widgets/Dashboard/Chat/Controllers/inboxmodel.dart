import 'dart:convert';

class ChatTileApiModel {
  final String? username;
  final String? profilePic;
  final String? id;
  final bool?  onlineStatus;
  final BusinessReff? businessReff;
  final List<Message>? messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String?  receiver;
  final dynamic lastMessage;
  final int? unreadMessages;

  ChatTileApiModel( {
    this.username,
    this.receiver,
    this.onlineStatus,
    this.profilePic,
    this.id,
    this.businessReff,
    this.messages,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMessage,
    this.unreadMessages,
  });

  factory ChatTileApiModel.fromRawJson(String str) => ChatTileApiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatTileApiModel.fromJson(Map<String, dynamic> json) => ChatTileApiModel(
    username: json["username"],
    profilePic: json["profilePic"],
    id: json["_id"],
    onlineStatus: json["onlineStatus"],
    receiver: json['receiver'],
    businessReff: json["businessReff"] == null ? null : BusinessReff.fromJson(json["businessReff"]),
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    lastMessage: json["lastMessage"].runtimeType==String?json["lastMessage"] :json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
    unreadMessages: json["unreadMessages"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "onlineStatus":onlineStatus
,    "profilePic": profilePic,
    "_id": id,
    "receiver":receiver,
    "businessReff": businessReff?.toJson(),
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "lastMessage": lastMessage?.toJson(),
    "unreadMessages": unreadMessages,
  };
}

class BusinessReff {
  final String? id;
  final String? name;

  BusinessReff({
    this.id,
    this.name,
  });

  factory BusinessReff.fromRawJson(String str) => BusinessReff.fromJson(json.decode(str));

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

class LastMessage {
  final String? id;
  final String? content;

  LastMessage({
    this.id,
    this.content,
  });

  factory LastMessage.fromRawJson(String str) => LastMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
    id: json["_id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
  };
}

class Message {
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

  Message({
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

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
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
