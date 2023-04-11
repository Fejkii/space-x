import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Company {
  Headquarters? headquarters;
  Links? links;
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launchSites;
  int? testSites;
  String? ceo;
  String? cto;
  String? coo;
  String? ctoPropulsion;
  int? valuation;
  String? summary;
  String? id;
  Company({
    this.headquarters,
    this.links,
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.vehicles,
    this.launchSites,
    this.testSites,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.valuation,
    this.summary,
    this.id,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Headquarters {
  String? address;
  String? city;
  String? state;
  Headquarters({
    this.address,
    this.city,
    this.state,
  });

  factory Headquarters.fromJson(Map<String, dynamic> json) => _$HeadquartersFromJson(json);

  Map<String, dynamic> toJson() => _$HeadquartersToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Links {
  String? website;
  String? flickr;
  String? twitter;
  String? elonTwitter;
  Links({
    this.website,
    this.flickr,
    this.twitter,
    this.elonTwitter,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
