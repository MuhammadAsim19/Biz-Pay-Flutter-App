import 'dart:convert';

class AddBusinessModel {
  String? name;
  String? owner;
  String? industry;
  String? employee;
  String? description;
  String? yearFound;
  String? country;
  String? city;
  String? address;
  String? zipCode;
  String? businessHour;
  List<String>? advantages;
  String? registrationNumber;
  List<String?>? documnets;
  String? salesPrice;
  List<Map<String, dynamic>>? financialDetails;
  List<String?>? images;

  AddBusinessModel(
      {this.name,
      this.owner,
      this.industry,
      this.employee,
      this.description,
      this.yearFound,
      this.country,
      this.city,
      this.address,
      this.zipCode,
      this.businessHour,
      this.advantages,
      this.registrationNumber,
      this.documnets,
      this.salesPrice,
      this.financialDetails,
      this.images});

  AddBusinessModel copyWith({
    String? name,
    String? owner,
    String? industry,
    String? employee,
    String? description,
    String? yearFound,
    String? country,
    String? city,
    String? address,
    String? zipCode,
    String? businessHour,
    List<String>? advantages,
    String? registrationNumber,
    List<String>? documents,
    String? salesPrice,
    List<Map<String, dynamic>>? financialDetails,
    List<String?>? images,
  }) {
    return AddBusinessModel(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      industry: industry ?? this.industry,
      employee: employee ?? this.employee,
      description: description ?? this.description,
      yearFound: yearFound ?? this.yearFound,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      zipCode: zipCode ?? this.zipCode,
      businessHour: businessHour ?? this.businessHour,
      advantages: advantages ?? this.advantages,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      documnets: documents ?? this.documnets,
      salesPrice: salesPrice ?? this.salesPrice,
      financialDetails: financialDetails ?? this.financialDetails,
      images: images ?? this.images,
    );
  }

  factory AddBusinessModel.fromJson(Map<String, dynamic> json) {
    return AddBusinessModel(
      name: json['name'],
      owner: json['owner'],
      industry: json['industry'],
      employee: json['employee'],
      description: json['description'],
      yearFound: json['yearFound'],
      country: json['country'],
      city: json['city'],
      address: json['address'],
      zipCode: json['zipCode'],
      businessHour: json['businessHour'],
      advantages: List<String>.from(json['advantages'] ?? []),
      registrationNumber: json['registrationNumber'],
      documnets: List<String>.from(json['images'] ?? []),
      salesPrice: json['salesPrice'],
      financialDetails:
          List<Map<String, dynamic>>.from(json['financialDetails'] ?? []),
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numberOfEmployes': owner,
      'industry': industry,
      'numberOfOwners': employee,
      'businessDescription': description,
      'foundationYear': yearFound,
      'country': country,
      'city': city,
      'address': address,
      'zipCode': zipCode,
      'businessHours': businessHour,
      'advantages': jsonEncode(advantages),
      'registrationNumber': registrationNumber,
      'salePrice': salesPrice,
      'financialDetails': jsonEncode(financialDetails),
    };
  }
}
