//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseEventsDetailGet {
  /// Returns a new [ResponseEventsDetailGet] instance.
  ResponseEventsDetailGet({
    @required this.id,
    @required this.title,
    @required this.eventDate,
    this.eventTime,
    @required this.countType,
    @required this.displayType,
    this.imageName,
  });

  /// イベントID
  int id;

  /// イベントタイトル
  String title;

  /// イベント日付
  String eventDate;

  /// イベント時間
  String eventTime;

  /// カウントタイプ（progress:経過、left:残り）
  ResponseEventsDetailGetCountTypeEnum countType;

  /// 表示タイプ（day:日付、time:日時）
  ResponseEventsDetailGetDisplayTypeEnum displayType;

  /// 画像ファイル名
  String imageName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseEventsDetailGet &&
     other.id == id &&
     other.title == title &&
     other.eventDate == eventDate &&
     other.eventTime == eventTime &&
     other.countType == countType &&
     other.displayType == displayType &&
     other.imageName == imageName;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (title == null ? 0 : title.hashCode) +
    (eventDate == null ? 0 : eventDate.hashCode) +
    (eventTime == null ? 0 : eventTime.hashCode) +
    (countType == null ? 0 : countType.hashCode) +
    (displayType == null ? 0 : displayType.hashCode) +
    (imageName == null ? 0 : imageName.hashCode);

  @override
  String toString() => 'ResponseEventsDetailGet[id=$id, title=$title, eventDate=$eventDate, eventTime=$eventTime, countType=$countType, displayType=$displayType, imageName=$imageName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = id;
      json[r'title'] = title;
      json[r'event_date'] = eventDate;
    if (eventTime != null) {
      json[r'event_time'] = eventTime;
    }
      json[r'count_type'] = countType;
      json[r'display_type'] = displayType;
    if (imageName != null) {
      json[r'image_name'] = imageName;
    }
    return json;
  }

  /// Returns a new [ResponseEventsDetailGet] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseEventsDetailGet fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseEventsDetailGet(
        id: json[r'id'],
        title: json[r'title'],
        eventDate: json[r'event_date'],
        eventTime: json[r'event_time'],
        countType: ResponseEventsDetailGetCountTypeEnum.fromJson(json[r'count_type']),
        displayType: ResponseEventsDetailGetDisplayTypeEnum.fromJson(json[r'display_type']),
        imageName: json[r'image_name'],
    );

  static List<ResponseEventsDetailGet> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventsDetailGet>[]
      : json.map((dynamic value) => ResponseEventsDetailGet.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseEventsDetailGet> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseEventsDetailGet>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseEventsDetailGet.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseEventsDetailGet-objects as value to a dart map
  static Map<String, List<ResponseEventsDetailGet>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseEventsDetailGet>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseEventsDetailGet.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

/// カウントタイプ（progress:経過、left:残り）
class ResponseEventsDetailGetCountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ResponseEventsDetailGetCountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const progress = ResponseEventsDetailGetCountTypeEnum._(r'progress');
  static const left = ResponseEventsDetailGetCountTypeEnum._(r'left');

  /// List of all possible values in this [enum][ResponseEventsDetailGetCountTypeEnum].
  static const values = <ResponseEventsDetailGetCountTypeEnum>[
    progress,
    left,
  ];

  static ResponseEventsDetailGetCountTypeEnum fromJson(dynamic value) =>
    ResponseEventsDetailGetCountTypeEnumTypeTransformer().decode(value);

  static List<ResponseEventsDetailGetCountTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventsDetailGetCountTypeEnum>[]
      : json
          .map((value) => ResponseEventsDetailGetCountTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [ResponseEventsDetailGetCountTypeEnum] to String,
/// and [decode] dynamic data back to [ResponseEventsDetailGetCountTypeEnum].
class ResponseEventsDetailGetCountTypeEnumTypeTransformer {
  const ResponseEventsDetailGetCountTypeEnumTypeTransformer._();

  factory ResponseEventsDetailGetCountTypeEnumTypeTransformer() => _instance ??= ResponseEventsDetailGetCountTypeEnumTypeTransformer._();

  String encode(ResponseEventsDetailGetCountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ResponseEventsDetailGetCountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ResponseEventsDetailGetCountTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'progress': return ResponseEventsDetailGetCountTypeEnum.progress;
      case r'left': return ResponseEventsDetailGetCountTypeEnum.left;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [ResponseEventsDetailGetCountTypeEnumTypeTransformer] instance.
  static ResponseEventsDetailGetCountTypeEnumTypeTransformer _instance;
}

/// 表示タイプ（day:日付、time:日時）
class ResponseEventsDetailGetDisplayTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ResponseEventsDetailGetDisplayTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const day = ResponseEventsDetailGetDisplayTypeEnum._(r'day');
  static const time = ResponseEventsDetailGetDisplayTypeEnum._(r'time');

  /// List of all possible values in this [enum][ResponseEventsDetailGetDisplayTypeEnum].
  static const values = <ResponseEventsDetailGetDisplayTypeEnum>[
    day,
    time,
  ];

  static ResponseEventsDetailGetDisplayTypeEnum fromJson(dynamic value) =>
    ResponseEventsDetailGetDisplayTypeEnumTypeTransformer().decode(value);

  static List<ResponseEventsDetailGetDisplayTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventsDetailGetDisplayTypeEnum>[]
      : json
          .map((value) => ResponseEventsDetailGetDisplayTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [ResponseEventsDetailGetDisplayTypeEnum] to String,
/// and [decode] dynamic data back to [ResponseEventsDetailGetDisplayTypeEnum].
class ResponseEventsDetailGetDisplayTypeEnumTypeTransformer {
  const ResponseEventsDetailGetDisplayTypeEnumTypeTransformer._();

  factory ResponseEventsDetailGetDisplayTypeEnumTypeTransformer() => _instance ??= ResponseEventsDetailGetDisplayTypeEnumTypeTransformer._();

  String encode(ResponseEventsDetailGetDisplayTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ResponseEventsDetailGetDisplayTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ResponseEventsDetailGetDisplayTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'day': return ResponseEventsDetailGetDisplayTypeEnum.day;
      case r'time': return ResponseEventsDetailGetDisplayTypeEnum.time;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [ResponseEventsDetailGetDisplayTypeEnumTypeTransformer] instance.
  static ResponseEventsDetailGetDisplayTypeEnumTypeTransformer _instance;
}

