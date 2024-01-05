import 'dart:convert';

class WishList {
  final String? id;
  final String? name;
  final String? foundationYear;
  final String? numberOfOwners;
  final String? numberOfEmployes;
  final String? businessDescription;
  final List<String>? images;
  final List<String>? attachedFiles;
  final List<String>? advantages;
  final int? salePrice;
  final List<FinancialDetail>? financialDetails;
  final String? country;
  final String? city;
  final String? address;
  final String? zipcode;
  final String? industry;
  final List<dynamic>? subIndustry;
  final String? status;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  WishList({
    this.id,
    this.name,
    this.foundationYear,
    this.numberOfOwners,
    this.numberOfEmployes,
    this.businessDescription,
    this.images,
    this.attachedFiles,
    this.advantages,
    this.salePrice,
    this.financialDetails,
    this.country,
    this.city,
    this.address,
    this.zipcode,
    this.industry,
    this.subIndustry,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WishList.fromRawJson(String str) =>
      WishList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
        id: json["_id"],
        name: json["name"],
        foundationYear: json["foundationYear"],
        numberOfOwners: json["numberOfOwners"].toString(),
        numberOfEmployes: json["numberOfEmployes"].toString(),
        businessDescription: json["businessDescription"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        attachedFiles: json["attached_files"] == null
            ? []
            : List<String>.from(json["attached_files"]!.map((x) => x)),
        advantages: json["advantages"] == null
            ? []
            : List<String>.from(json["advantages"]!.map((x) => x)),
        salePrice: json["salePrice"],
        financialDetails: json["financialDetails"] == null
            ? []
            : List<FinancialDetail>.from(json["financialDetails"]!
                .map((x) => FinancialDetail.fromJson(x))),
        country: json["country"],
        city: json["city"],
        address: json["address"],
        zipcode: json["zipcode"],
        industry: json["industry"],
        subIndustry: json["subIndustry"] == null
            ? []
            : List<dynamic>.from(json["subIndustry"]!.map((x) => x)),
        status: json["status"],
        createdBy: json["createdBy"],
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
        "name": name,
        "foundationYear": foundationYear,
        "numberOfOwners": numberOfOwners,
        "numberOfEmployes": numberOfEmployes,
        "businessDescription": businessDescription,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "attached_files": attachedFiles == null
            ? []
            : List<dynamic>.from(attachedFiles!.map((x) => x)),
        "advantages": advantages == null
            ? []
            : List<dynamic>.from(advantages!.map((x) => x)),
        "salePrice": salePrice,
        "financialDetails": financialDetails == null
            ? []
            : List<dynamic>.from(financialDetails!.map((x) => x.toJson())),
        "country": country,
        "city": city,
        "address": address,
        "zipcode": zipcode,
        "industry": industry,
        "subIndustry": subIndustry == null
            ? []
            : List<dynamic>.from(subIndustry!.map((x) => x)),
        "status": status,
        "createdBy": createdBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class FinancialDetail {
  final String? financialYear;
  final int? revenue;
  final String? id;

  FinancialDetail({
    this.financialYear,
    this.revenue,
    this.id,
  });

  factory FinancialDetail.fromRawJson(String str) =>
      FinancialDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FinancialDetail.fromJson(Map<String, dynamic> json) =>
      FinancialDetail(
        financialYear: json["financialYear"],
        revenue: json["revenue"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "financialYear": financialYear,
        "revenue": revenue,
        "_id": id,
      };
}
