import 'dart:convert';

BalanceModel balanceModelFromJson(String str) =>
    BalanceModel.fromJson(json.decode(str));

String balanceModelToJson(BalanceModel data) => json.encode(data.toJson());

class BalanceModel {
  final String? id;
  final String? walletId;
  final double? balance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  BalanceModel({
    this.id,
    this.walletId,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  BalanceModel copyWith({
    String? id,
    String? walletId,
    double? balance,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      BalanceModel(
        id: id ?? this.id,
        walletId: walletId ?? this.walletId,
        balance: balance ?? this.balance,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        id: json["_id"],
        walletId: json["walletId"],
        balance: double.parse(json["balance"].toString()),
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
        "walletId": walletId,
        "balance": balance,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
