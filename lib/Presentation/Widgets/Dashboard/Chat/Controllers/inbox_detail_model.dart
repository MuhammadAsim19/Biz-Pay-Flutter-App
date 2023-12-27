// import 'dart:convert';
//
// class ChatTileApiModelDetail {
//   final String? username;
//   final String? profilePic;
//   final bool? onlineStatus;
//   final String? receiver;
//   final String? blockedUser;
//   final List<GroupedMessage>? groupedMessages;
//   final String? businessTitle;
//   final String? id;
//   final List<Message>? messages;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;
//   final String? lastMessage;
//
//   ChatTileApiModelDetail({
//     this.username,
//     this.profilePic,
//     this.onlineStatus,
//     this.receiver,
//     this.blockedUser,
//     this.groupedMessages,
//     this.businessTitle,
//     this.id,
//     this.messages,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.lastMessage,
//   });
//
//   factory ChatTileApiModelDetail.fromRawJson(String str) => ChatTileApiModelDetail.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory ChatTileApiModelDetail.fromJson(Map<String, dynamic> json) => ChatTileApiModelDetail(
//     username: json["username"],
//     profilePic: json["profilePic"],
//     onlineStatus: json["onlineStatus"],
//     receiver: json["receiver"],
//     blockedUser: json["blockedUser"],
//     groupedMessages: json["groupedMessages"] == null ? [] : List<GroupedMessage>.from(json["groupedMessages"]!.map((x) => GroupedMessage.fromJson(x))),
//     businessTitle: json["businessTitle"],
//     id: json["_id"],
//     messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     lastMessage: json["lastMessage"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "username": username,
//     "profilePic": profilePic,
//     "onlineStatus": onlineStatus,
//     "receiver": receiver,
//     "blockedUser": blockedUser,
//     "groupedMessages": groupedMessages == null ? [] : List<dynamic>.from(groupedMessages!.map((x) => x.toJson())),
//     "businessTitle": businessTitle,
//     "_id": id,
//     "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "lastMessage": lastMessage,
//   };
// }
//
// class GroupedMessage {
//   final Id? id;
//   final List<Message>? messages;
//
//   GroupedMessage({
//     this.id,
//     this.messages,
//   });
//
//   factory GroupedMessage.fromRawJson(String str) => GroupedMessage.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory GroupedMessage.fromJson(Map<String, dynamic> json) => GroupedMessage(
//     id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
//     messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id?.toJson(),
//     "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
//   };
// }
//
// class Id {
//   final int? year;
//   final int? month;
//   final int? day;
//
//   Id({
//     this.year,
//     this.month,
//     this.day,
//   });
//
//   factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Id.fromJson(Map<String, dynamic> json) => Id(
//     year: json["year"],
//     month: json["month"],
//     day: json["day"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "year": year,
//     "month": month,
//     "day": day,
//   };
// }
//
// class Message {
//   final String? id;
//   final Receiver? sender;
//   final Receiver? receiver;
//   final String? businessConversation;
//   final String? type;
//   final List<dynamic>? images;
//   final List<String>? videos;
//   final List<dynamic>? docs;
//   final List<dynamic>? audios;
//   final String? content;
//   final bool? isRead;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;
//
//   Message({
//     this.id,
//     this.sender,
//     this.receiver,
//     this.businessConversation,
//     this.type,
//     this.images,
//     this.videos,
//     this.docs,
//     this.audios,
//     this.content,
//     this.isRead,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });
//
//   factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//     id: json["_id"],
//     sender: receiverValues.map[json["sender"]]!,
//     receiver: receiverValues.map[json["receiver"]]!,
//     businessConversation: json["businessConversation"],
//     type: json["type"],
//     images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
//     videos: json["videos"] == null ? [] : List<String>.from(json["videos"]!.map((x) => x)),
//     docs: json["docs"] == null ? [] : List<dynamic>.from(json["docs"]!.map((x) => x)),
//     audios: json["audios"] == null ? [] : List<dynamic>.from(json["audios"]!.map((x) => x)),
//     content: json["content"],
//     isRead: json["isRead"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "sender": receiverValues.reverse[sender],
//     "receiver": receiverValues.reverse[receiver],
//     "businessConversation": businessConversation,
//     "type": type,
//     "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
//     "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
//     "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x)),
//     "audios": audios == null ? [] : List<dynamic>.from(audios!.map((x) => x)),
//     "content": content,
//     "isRead": isRead,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//   };
// }
//
// enum Receiver {
//   THE_6579_EA61_D76_F7_A30_F94_F5_C80,
//   THE_6579_F21_C00996_AA38_F7_C7_A2_B
// }
//
// final receiverValues = EnumValues({
//   "6579ea61d76f7a30f94f5c80": Receiver.THE_6579_EA61_D76_F7_A30_F94_F5_C80,
//   "6579f21c00996aa38f7c7a2b": Receiver.THE_6579_F21_C00996_AA38_F7_C7_A2_B
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
