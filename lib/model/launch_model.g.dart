// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      fairings: json['fairings'],
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      staticFireDateUtc: json['static_fire_date_utc'] == null
          ? null
          : DateTime.parse(json['static_fire_date_utc'] as String),
      staticFireDateUnix: json['static_fire_date_unix'] as int?,
      tdb: json['tdb'] as bool,
      net: json['net'] as bool,
      window: json['window'] as int?,
      rocket: json['rocket'] as String,
      success: json['success'] as bool?,
      failures: json['failures'] as List<dynamic>,
      details: json['details'] as String?,
      crew: json['crew'] as List<dynamic>,
      ships: json['ships'] as List<dynamic>,
      capsules:
          (json['capsules'] as List<dynamic>).map((e) => e as String).toList(),
      payloads:
          (json['payloads'] as List<dynamic>).map((e) => e as String).toList(),
      launchpad: json['launchpad'] as String,
      autoUpdate: json['auto_update'] as bool,
      flightNumber: json['flight_number'] as int,
      name: json['name'] as String,
      dateUtc: DateTime.parse(json['date_utc'] as String),
      dateUnix: json['date_unix'] as int,
      dateLocal: DateTime.parse(json['date_local'] as String),
      datePrecision:
          $enumDecode(_$DatePrecisionEnumMap, json['date_precision']),
      upcoming: json['upcoming'] as bool,
      cores: (json['cores'] as List<dynamic>)
          .map((e) => Core.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'fairings': instance.fairings,
      'links': instance.links,
      'static_fire_date_utc': instance.staticFireDateUtc?.toIso8601String(),
      'static_fire_date_unix': instance.staticFireDateUnix,
      'tdb': instance.tdb,
      'net': instance.net,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'failures': instance.failures,
      'details': instance.details,
      'crew': instance.crew,
      'ships': instance.ships,
      'capsules': instance.capsules,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'auto_update': instance.autoUpdate,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_utc': instance.dateUtc.toIso8601String(),
      'date_unix': instance.dateUnix,
      'date_local': instance.dateLocal.toIso8601String(),
      'date_precision': _$DatePrecisionEnumMap[instance.datePrecision]!,
      'upcoming': instance.upcoming,
      'cores': instance.cores,
      'id': instance.id,
    };

const _$DatePrecisionEnumMap = {
  DatePrecision.half: 'half',
  DatePrecision.quarter: 'quarter',
  DatePrecision.year: 'year',
  DatePrecision.month: 'month',
  DatePrecision.day: 'day',
  DatePrecision.hour: 'hour',
};

Core _$CoreFromJson(Map<String, dynamic> json) => Core(
      core: json['core'] as String?,
      flight: json['flight'] as int?,
      gridfins: json['gridfins'] as bool?,
      legs: json['legs'] as bool?,
      reused: json['reused'] as bool?,
      landingAttempt: json['landingAttempt'] as bool?,
      landingSuccess: json['landingSuccess'] as bool?,
      landingType: json['landingType'] as String?,
      landpad: json['landpad'] as String?,
    );

Map<String, dynamic> _$CoreToJson(Core instance) => <String, dynamic>{
      'core': instance.core,
      'flight': instance.flight,
      'gridfins': instance.gridfins,
      'legs': instance.legs,
      'reused': instance.reused,
      'landingAttempt': instance.landingAttempt,
      'landingSuccess': instance.landingSuccess,
      'landingType': instance.landingType,
      'landpad': instance.landpad,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      patch: Patch.fromJson(json['patch'] as Map<String, dynamic>),
      reddit: Reddit.fromJson(json['reddit'] as Map<String, dynamic>),
      flickr: Flickr.fromJson(json['flickr'] as Map<String, dynamic>),
      presskit: json['presskit'] as String?,
      webcast: json['webcast'] as String?,
      youtubeId: json['youtubeId'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch,
      'reddit': instance.reddit,
      'flickr': instance.flickr,
      'presskit': instance.presskit,
      'webcast': instance.webcast,
      'youtubeId': instance.youtubeId,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
    };

Flickr _$FlickrFromJson(Map<String, dynamic> json) => Flickr(
      small: (json['small'] as List<dynamic>).map((e) => e as String).toList(),
      original:
          (json['original'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FlickrToJson(Flickr instance) => <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };

Patch _$PatchFromJson(Map<String, dynamic> json) => Patch(
      small: json['small'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };

Reddit _$RedditFromJson(Map<String, dynamic> json) => Reddit(
      campaign: json['campaign'] as String?,
      launch: json['launch'] as String?,
      media: json['media'] as String?,
      recovery: json['recovery'] as String?,
    );

Map<String, dynamic> _$RedditToJson(Reddit instance) => <String, dynamic>{
      'campaign': instance.campaign,
      'launch': instance.launch,
      'media': instance.media,
      'recovery': instance.recovery,
    };
