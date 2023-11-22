import 'dart:convert';

class PrivacyAndTermsModel {
  final String? id;
  final String? title;
  final String? version;
  final String? privacyAndTermsModelFor;
  final String? type;
  final String? description;
  final Points? points;

  PrivacyAndTermsModel({
    this.id,
    this.title,
    this.version,
    this.privacyAndTermsModelFor,
    this.type,
    this.description,
    this.points,
  });

  PrivacyAndTermsModel copyWith({
    String? id,
    String? title,
    String? version,
    String? privacyAndTermsModelFor,
    String? type,
    String? description,
    Points? points,
  }) =>
      PrivacyAndTermsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        version: version ?? this.version,
        privacyAndTermsModelFor:
            privacyAndTermsModelFor ?? this.privacyAndTermsModelFor,
        type: type ?? this.type,
        description: description ?? this.description,
        points: points ?? this.points,
      );

  factory PrivacyAndTermsModel.fromRawJson(String str) =>
      PrivacyAndTermsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrivacyAndTermsModel.fromJson(Map<String, dynamic> json) =>
      PrivacyAndTermsModel(
        id: json["_id"],
        title: json["title"],
        version: json["version"],
        privacyAndTermsModelFor: json["for"],
        type: json["type"],
        description: json["description"],
        points: json["points"] == null ? null : Points.fromJson(json["points"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "version": version,
        "for": privacyAndTermsModelFor,
        "type": type,
        "description": description,
        "points": points?.toJson(),
      };
}

class Points {
  final String? title;
  final List<ListElement>? list;

  Points({
    this.title,
    this.list,
  });

  Points copyWith({
    String? title,
    List<ListElement>? list,
  }) =>
      Points(
        title: title ?? this.title,
        list: list ?? this.list,
      );

  factory Points.fromRawJson(String str) => Points.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Points.fromJson(Map<String, dynamic> json) => Points(
        title: json["title"],
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  final String? title;
  final String? icon;
  final String? desc;

  ListElement({
    this.title,
    this.icon,
    this.desc,
  });

  ListElement copyWith({
    String? title,
    String? icon,
    String? desc,
  }) =>
      ListElement(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        desc: desc ?? this.desc,
      );

  factory ListElement.fromRawJson(String str) =>
      ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      ListElement(title: json["title"], icon: json["icon"], desc: json['desc']);

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "desc": desc,
      };
}
