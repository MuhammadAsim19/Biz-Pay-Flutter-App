import 'dart:convert';

class PrivacyPolicyModel {
  final String? id;
  final String? title;
  final int? priority;
  final String? description;
  final String? version;
  final String? privacyPolicyFor;
  final String? type;
  final List<Point>? points;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  PrivacyPolicyModel({
    this.id,
    this.title,
    this.priority,
    this.description,
    this.version,
    this.privacyPolicyFor,
    this.type,
    this.points,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PrivacyPolicyModel.fromRawJson(String str) =>
      PrivacyPolicyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      PrivacyPolicyModel(
        id: json["_id"],
        title: json["title"],
        priority: json["priority"],
        description: json["description"],
        version: json["version"],
        privacyPolicyFor: json["for"],
        type: json["type"],
        points: json["points"] == null
            ? []
            : List<Point>.from(json["points"]!.map((x) => Point.fromJson(x))),
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
        "priority": priority,
        "description": description,
        "version": version,
        "for": privacyPolicyFor,
        "type": type,
        "points": points == null
            ? []
            : List<dynamic>.from(points!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Point {
  final String? title;
  final String? description;
  final List<ListElement>? list;
  final String? id;

  Point({
    this.title,
    this.description,
    this.list,
    this.id,
  });

  factory Point.fromRawJson(String str) => Point.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        title: json["title"],
        description: json["description"],
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "_id": id,
      };
}

class ListElement {
  final String? title;
  final String? icon;
  final String? id;

  ListElement({
    this.title,
    this.icon,
    this.id,
  });

  factory ListElement.fromRawJson(String str) =>
      ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        title: json["title"],
        icon: json["icon"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "_id": id,
      };
}
