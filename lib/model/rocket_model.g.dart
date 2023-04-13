// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) => Rocket(
      height: json['height'] == null
          ? null
          : Height.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
      mass: json['mass'] == null
          ? null
          : Mass.fromJson(json['mass'] as Map<String, dynamic>),
      firststage: json['firststage'] == null
          ? null
          : FirstStage.fromJson(json['firststage'] as Map<String, dynamic>),
      secondstage: json['secondstage'] == null
          ? null
          : SecondStage.fromJson(json['secondstage'] as Map<String, dynamic>),
      engines: json['engines'] == null
          ? null
          : Engines.fromJson(json['engines'] as Map<String, dynamic>),
      landinglegs: json['landinglegs'] == null
          ? null
          : LandingLegs.fromJson(json['landinglegs'] as Map<String, dynamic>),
      payloadweights: (json['payloadweights'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PayloadWeight.fromJson(e as Map<String, dynamic>))
          .toList(),
      flickrimages: (json['flickrimages'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
      stages: json['stages'] as int?,
      boosters: json['boosters'] as int?,
      costperlaunch: json['costperlaunch'] as int?,
      successratepct: json['successratepct'] as int?,
      firstflight: json['firstflight'] as String?,
      country: json['country'] as String?,
      company: json['company'] as String?,
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'height': instance.height,
      'diameter': instance.diameter,
      'mass': instance.mass,
      'firststage': instance.firststage,
      'secondstage': instance.secondstage,
      'engines': instance.engines,
      'landinglegs': instance.landinglegs,
      'payloadweights': instance.payloadweights,
      'flickrimages': instance.flickrimages,
      'name': instance.name,
      'type': instance.type,
      'active': instance.active,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'costperlaunch': instance.costperlaunch,
      'successratepct': instance.successratepct,
      'firstflight': instance.firstflight,
      'country': instance.country,
      'company': instance.company,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
    };

CompositeFairing _$CompositeFairingFromJson(Map<String, dynamic> json) =>
    CompositeFairing(
      height: json['height'] == null
          ? null
          : Height.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompositeFairingToJson(CompositeFairing instance) =>
    <String, dynamic>{
      'height': instance.height,
      'diameter': instance.diameter,
    };

Diameter _$DiameterFromJson(Map<String, dynamic> json) => Diameter(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DiameterToJson(Diameter instance) => <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

Engines _$EnginesFromJson(Map<String, dynamic> json) => Engines(
      isp: json['isp'] == null
          ? null
          : Isp.fromJson(json['isp'] as Map<String, dynamic>),
      thrustsealevel: json['thrustsealevel'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrustsealevel'] as Map<String, dynamic>),
      thrustvacuum: json['thrustvacuum'] == null
          ? null
          : ThrustVacuum.fromJson(json['thrustvacuum'] as Map<String, dynamic>),
      number: json['number'] as int?,
      type: json['type'] as String?,
      version: json['version'] as String?,
      layout: json['layout'] as String?,
      enginelossmax: json['enginelossmax'] as int?,
      propellant1: json['propellant1'] as String?,
      propellant2: json['propellant2'] as String?,
      thrusttoweight: (json['thrusttoweight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EnginesToJson(Engines instance) => <String, dynamic>{
      'isp': instance.isp,
      'thrustsealevel': instance.thrustsealevel,
      'thrustvacuum': instance.thrustvacuum,
      'number': instance.number,
      'type': instance.type,
      'version': instance.version,
      'layout': instance.layout,
      'enginelossmax': instance.enginelossmax,
      'propellant1': instance.propellant1,
      'propellant2': instance.propellant2,
      'thrusttoweight': instance.thrusttoweight,
    };

FirstStage _$FirstStageFromJson(Map<String, dynamic> json) => FirstStage(
      thrustsealevel: json['thrustsealevel'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrustsealevel'] as Map<String, dynamic>),
      thrustvacuum: json['thrustvacuum'] == null
          ? null
          : ThrustVacuum.fromJson(json['thrustvacuum'] as Map<String, dynamic>),
      reusable: json['reusable'] as bool?,
      engines: json['engines'] as int?,
      fuelamounttons: json['fuelamounttons'] as int?,
      burntimesec: json['burntimesec'] as int?,
    );

Map<String, dynamic> _$FirstStageToJson(FirstStage instance) =>
    <String, dynamic>{
      'thrustsealevel': instance.thrustsealevel,
      'thrustvacuum': instance.thrustvacuum,
      'reusable': instance.reusable,
      'engines': instance.engines,
      'fuelamounttons': instance.fuelamounttons,
      'burntimesec': instance.burntimesec,
    };

Height _$HeightFromJson(Map<String, dynamic> json) => Height(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HeightToJson(Height instance) => <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

Isp _$IspFromJson(Map<String, dynamic> json) => Isp(
      sealevel: json['sealevel'] as int?,
      vacuum: json['vacuum'] as int?,
    );

Map<String, dynamic> _$IspToJson(Isp instance) => <String, dynamic>{
      'sealevel': instance.sealevel,
      'vacuum': instance.vacuum,
    };

LandingLegs _$LandingLegsFromJson(Map<String, dynamic> json) => LandingLegs(
      number: json['number'] as int?,
      material: json['material'] as String?,
    );

Map<String, dynamic> _$LandingLegsToJson(LandingLegs instance) =>
    <String, dynamic>{
      'number': instance.number,
      'material': instance.material,
    };

Mass _$MassFromJson(Map<String, dynamic> json) => Mass(
      kg: json['kg'] as int?,
      lb: json['lb'] as int?,
    );

Map<String, dynamic> _$MassToJson(Mass instance) => <String, dynamic>{
      'kg': instance.kg,
      'lb': instance.lb,
    };

Payloads _$PayloadsFromJson(Map<String, dynamic> json) => Payloads(
      compositefairing: json['compositefairing'] == null
          ? null
          : CompositeFairing.fromJson(
              json['compositefairing'] as Map<String, dynamic>),
      option1: json['option1'] as String?,
    );

Map<String, dynamic> _$PayloadsToJson(Payloads instance) => <String, dynamic>{
      'compositefairing': instance.compositefairing,
      'option1': instance.option1,
    };

PayloadWeight _$PayloadWeightFromJson(Map<String, dynamic> json) =>
    PayloadWeight(
      id: json['id'] as String?,
      name: json['name'] as String?,
      kg: json['kg'] as int?,
      lb: json['lb'] as int?,
    );

Map<String, dynamic> _$PayloadWeightToJson(PayloadWeight instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kg': instance.kg,
      'lb': instance.lb,
    };

SecondStage _$SecondStageFromJson(Map<String, dynamic> json) => SecondStage(
      thrust: json['thrust'] == null
          ? null
          : Thrust.fromJson(json['thrust'] as Map<String, dynamic>),
      payloads: json['payloads'] == null
          ? null
          : Payloads.fromJson(json['payloads'] as Map<String, dynamic>),
      reusable: json['reusable'] as bool?,
      engines: json['engines'] as int?,
      fuelamounttons: json['fuelamounttons'] as int?,
      burntimesec: json['burntimesec'] as int?,
    );

Map<String, dynamic> _$SecondStageToJson(SecondStage instance) =>
    <String, dynamic>{
      'thrust': instance.thrust,
      'payloads': instance.payloads,
      'reusable': instance.reusable,
      'engines': instance.engines,
      'fuelamounttons': instance.fuelamounttons,
      'burntimesec': instance.burntimesec,
    };

Thrust _$ThrustFromJson(Map<String, dynamic> json) => Thrust(
      kN: json['k_n'] as int?,
      lbf: json['lbf'] as int?,
    );

Map<String, dynamic> _$ThrustToJson(Thrust instance) => <String, dynamic>{
      'k_n': instance.kN,
      'lbf': instance.lbf,
    };

ThrustSeaLevel _$ThrustSeaLevelFromJson(Map<String, dynamic> json) =>
    ThrustSeaLevel(
      kN: json['k_n'] as int?,
      lbf: json['lbf'] as int?,
    );

Map<String, dynamic> _$ThrustSeaLevelToJson(ThrustSeaLevel instance) =>
    <String, dynamic>{
      'k_n': instance.kN,
      'lbf': instance.lbf,
    };

ThrustVacuum _$ThrustVacuumFromJson(Map<String, dynamic> json) => ThrustVacuum(
      kN: json['k_n'] as int?,
      lbf: json['lbf'] as int?,
    );

Map<String, dynamic> _$ThrustVacuumToJson(ThrustVacuum instance) =>
    <String, dynamic>{
      'k_n': instance.kN,
      'lbf': instance.lbf,
    };
