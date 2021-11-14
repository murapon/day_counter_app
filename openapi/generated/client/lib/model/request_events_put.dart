//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestEventsPut {
  /// Returns a new [RequestEventsPut] instance.
  RequestEventsPut({
    @required this.title,
    @required this.eventTime,
    @required this.countType,
    @required this.displayType,
    this.image,
  });

  /// イベントタイトル
  String title;

  String eventTime;

  /// カウントタイプ（progress:経過、left:残り）
  RequestEventsPutCountTypeEnum countType;

  /// 表示形式（day:日、time:日時）
  RequestEventsPutDisplayTypeEnum displayType;

  /// base64エンコードした画像データ
  String image;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestEventsPut &&
     other.title == title &&
     other.eventTime == eventTime &&
     other.countType == countType &&
     other.displayType == displayType &&
     other.image == image;

  @override
  int get hashCode =>
    (title == null ? 0 : title.hashCode) +
    (eventTime == null ? 0 : eventTime.hashCode) +
    (countType == null ? 0 : countType.hashCode) +
    (displayType == null ? 0 : displayType.hashCode) +
    (image == null ? 0 : image.hashCode);

  @override
  String toString() => 'RequestEventsPut[title=$title, eventTime=$eventTime, countType=$countType, displayType=$displayType, image=$image]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'title'] = title;
      json[r'event_time'] = eventTime;
      json[r'count_type'] = countType;
      json[r'display_type'] = displayType;
    if (image != null) {
      json[r'image'] = image;
    }
    return json;
  }

  /// Returns a new [RequestEventsPut] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RequestEventsPut fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RequestEventsPut(
        title: json[r'title'],
        eventTime: json[r'event_time'],
        countType: RequestEventsPutCountTypeEnum.fromJson(json[r'count_type']),
        displayType: RequestEventsPutDisplayTypeEnum.fromJson(json[r'display_type']),
        image: json[r'image'],
    );

  static List<RequestEventsPut> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventsPut>[]
      : json.map((dynamic value) => RequestEventsPut.fromJson(value)).toList(growable: true == growable);

  static Map<String, RequestEventsPut> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RequestEventsPut>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = RequestEventsPut.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RequestEventsPut-objects as value to a dart map
  static Map<String, List<RequestEventsPut>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RequestEventsPut>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = RequestEventsPut.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

/// カウントタイプ（progress:経過、left:残り）
class RequestEventsPutCountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestEventsPutCountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const progress = RequestEventsPutCountTypeEnum._(r'progress');
  static const left = RequestEventsPutCountTypeEnum._(r'left');

  /// List of all possible values in this [enum][RequestEventsPutCountTypeEnum].
  static const values = <RequestEventsPutCountTypeEnum>[
    progress,
    left,
  ];

  static RequestEventsPutCountTypeEnum fromJson(dynamic value) =>
    RequestEventsPutCountTypeEnumTypeTransformer().decode(value);

  static List<RequestEventsPutCountTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventsPutCountTypeEnum>[]
      : json
          .map((value) => RequestEventsPutCountTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [RequestEventsPutCountTypeEnum] to String,
/// and [decode] dynamic data back to [RequestEventsPutCountTypeEnum].
class RequestEventsPutCountTypeEnumTypeTransformer {
  const RequestEventsPutCountTypeEnumTypeTransformer._();

  factory RequestEventsPutCountTypeEnumTypeTransformer() => _instance ??= RequestEventsPutCountTypeEnumTypeTransformer._();

  String encode(RequestEventsPutCountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestEventsPutCountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestEventsPutCountTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'progress': return RequestEventsPutCountTypeEnum.progress;
      case r'left': return RequestEventsPutCountTypeEnum.left;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [RequestEventsPutCountTypeEnumTypeTransformer] instance.
  static RequestEventsPutCountTypeEnumTypeTransformer _instance;
}

/// 表示形式（day:日、time:日時）
class RequestEventsPutDisplayTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestEventsPutDisplayTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const day = RequestEventsPutDisplayTypeEnum._(r'day');
  static const time = RequestEventsPutDisplayTypeEnum._(r'time');

  /// List of all possible values in this [enum][RequestEventsPutDisplayTypeEnum].
  static const values = <RequestEventsPutDisplayTypeEnum>[
    day,
    time,
  ];

  static RequestEventsPutDisplayTypeEnum fromJson(dynamic value) =>
    RequestEventsPutDisplayTypeEnumTypeTransformer().decode(value);

  static List<RequestEventsPutDisplayTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventsPutDisplayTypeEnum>[]
      : json
          .map((value) => RequestEventsPutDisplayTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [RequestEventsPutDisplayTypeEnum] to String,
/// and [decode] dynamic data back to [RequestEventsPutDisplayTypeEnum].
class RequestEventsPutDisplayTypeEnumTypeTransformer {
  const RequestEventsPutDisplayTypeEnumTypeTransformer._();

  factory RequestEventsPutDisplayTypeEnumTypeTransformer() => _instance ??= RequestEventsPutDisplayTypeEnumTypeTransformer._();

  String encode(RequestEventsPutDisplayTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestEventsPutDisplayTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestEventsPutDisplayTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'day': return RequestEventsPutDisplayTypeEnum.day;
      case r'time': return RequestEventsPutDisplayTypeEnum.time;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [RequestEventsPutDisplayTypeEnumTypeTransformer] instance.
  static RequestEventsPutDisplayTypeEnumTypeTransformer _instance;
}

