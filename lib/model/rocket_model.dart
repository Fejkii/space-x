import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Rocket {
  Height? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firststage;
  SecondStage? secondstage;
  Engines? engines;
  LandingLegs? landinglegs;
  List<PayloadWeight?>? payloadweights;
  List<String?>? flickrimages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costperlaunch;
  int? successratepct;
  String? firstflight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  Rocket({
    this.height,
    this.diameter,
    this.mass,
    this.firststage,
    this.secondstage,
    this.engines,
    this.landinglegs,
    this.payloadweights,
    this.flickrimages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costperlaunch,
    this.successratepct,
    this.firstflight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CompositeFairing {
  Height? height;
  Diameter? diameter;

  CompositeFairing({
    this.height,
    this.diameter,
  });

  factory CompositeFairing.fromJson(Map<String, dynamic> json) => _$CompositeFairingFromJson(json);

  Map<String, dynamic> toJson() => _$CompositeFairingToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Diameter {
  double? meters;
  double? feet;

  Diameter({
    this.meters,
    this.feet,
  });

  factory Diameter.fromJson(Map<String, dynamic> json) => _$DiameterFromJson(json);

  Map<String, dynamic> toJson() => _$DiameterToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Engines {
  Isp? isp;
  ThrustSeaLevel? thrustsealevel;
  ThrustVacuum? thrustvacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? enginelossmax;
  String? propellant1;
  String? propellant2;
  double? thrusttoweight;

  Engines({
    this.isp,
    this.thrustsealevel,
    this.thrustvacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.enginelossmax,
    this.propellant1,
    this.propellant2,
    this.thrusttoweight,
  });

  factory Engines.fromJson(Map<String, dynamic> json) => _$EnginesFromJson(json);

  Map<String, dynamic> toJson() => _$EnginesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FirstStage {
  ThrustSeaLevel? thrustsealevel;
  ThrustVacuum? thrustvacuum;
  bool? reusable;
  int? engines;
  int? fuelamounttons;
  int? burntimesec;

  FirstStage({
    this.thrustsealevel,
    this.thrustvacuum,
    this.reusable,
    this.engines,
    this.fuelamounttons,
    this.burntimesec,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) => _$FirstStageFromJson(json);

  Map<String, dynamic> toJson() => _$FirstStageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Height {
  double? meters;
  double? feet;

  Height({
    this.meters,
    this.feet,
  });

  factory Height.fromJson(Map<String, dynamic> json) => _$HeightFromJson(json);

  Map<String, dynamic> toJson() => _$HeightToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Isp {
  int? sealevel;
  int? vacuum;

  Isp({
    this.sealevel,
    this.vacuum,
  });

  factory Isp.fromJson(Map<String, dynamic> json) => _$IspFromJson(json);

  Map<String, dynamic> toJson() => _$IspToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LandingLegs {
  int? number;
  String? material;

  LandingLegs({
    this.number,
    this.material,
  });

  factory LandingLegs.fromJson(Map<String, dynamic> json) => _$LandingLegsFromJson(json);

  Map<String, dynamic> toJson() => _$LandingLegsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Mass {
  int? kg;
  int? lb;

  Mass({
    this.kg,
    this.lb,
  });

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);

  Map<String, dynamic> toJson() => _$MassToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Payloads {
  CompositeFairing? compositefairing;
  String? option1;

  Payloads({
    this.compositefairing,
    this.option1,
  });

  factory Payloads.fromJson(Map<String, dynamic> json) => _$PayloadsFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PayloadWeight {
  String? id;
  String? name;
  int? kg;
  int? lb;

  PayloadWeight({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  factory PayloadWeight.fromJson(Map<String, dynamic> json) => _$PayloadWeightFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadWeightToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SecondStage {
  Thrust? thrust;
  Payloads? payloads;
  bool? reusable;
  int? engines;
  int? fuelamounttons;
  int? burntimesec;

  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelamounttons,
    this.burntimesec,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) => _$SecondStageFromJson(json);

  Map<String, dynamic> toJson() => _$SecondStageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Thrust {
  int? kN;
  int? lbf;

  Thrust({
    this.kN,
    this.lbf,
  });

  factory Thrust.fromJson(Map<String, dynamic> json) => _$ThrustFromJson(json);

  Map<String, dynamic> toJson() => _$ThrustToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ThrustSeaLevel {
  int? kN;
  int? lbf;

  ThrustSeaLevel({
    this.kN,
    this.lbf,
  });

  factory ThrustSeaLevel.fromJson(Map<String, dynamic> json) => _$ThrustSeaLevelFromJson(json);

  Map<String, dynamic> toJson() => _$ThrustSeaLevelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ThrustVacuum {
  int? kN;
  int? lbf;

  ThrustVacuum({
    this.kN,
    this.lbf,
  });

  factory ThrustVacuum.fromJson(Map<String, dynamic> json) => _$ThrustVacuumFromJson(json);

  Map<String, dynamic> toJson() => _$ThrustVacuumToJson(this);
}
