//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestEventsPost {
  /// Returns a new [RequestEventsPost] instance.
  RequestEventsPost({
    @required this.title,
    this.eventTime,
    @required this.countType,
    @required this.displayType,
    this.image,
    @required this.eventDate,
  });

  /// イベントタイトル
  String title;

  /// 時間
  String eventTime;

  /// カウントタイプ（progress:経過、left:残り）
  RequestEventsPostCountTypeEnum countType;

  /// 表示形式（day:日、time:日時）
  RequestEventsPostDisplayTypeEnum displayType;

  /// base64エンコードした画像データ
  String image;

  /// 日
  String eventDate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestEventsPost &&
     other.title == title &&
     other.eventTime == eventTime &&
     other.countType == countType &&
     other.displayType == displayType &&
     other.image == image &&
     other.eventDate == eventDate;

  @override
  int get hashCode =>
    (title == null ? 0 : title.hashCode) +
    (eventTime == null ? 0 : eventTime.hashCode) +
    (countType == null ? 0 : countType.hashCode) +
    (displayType == null ? 0 : displayType.hashCode) +
    (image == null ? 0 : image.hashCode) +
    (eventDate == null ? 0 : eventDate.hashCode);

  @override
  String toString() => 'RequestEventsPost[title=$title, eventTime=$eventTime, countType=$countType, displayType=$displayType, image=$image, eventDate=$eventDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'title'] = title;
    if (eventTime != null) {
      json[r'event_time'] = eventTime;
    }
      json[r'count_type'] = countType;
      json[r'display_type'] = displayType;
    if (image != null) {
      json[r'image'] = image;
    }
      json[r'event_date'] = eventDate;
    return json;
  }

  /// Returns a new [RequestEventsPost] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RequestEventsPost fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RequestEventsPost(
        title: json[r'title'],
        eventTime: json[r'event_time'],
        countType: RequestEventsPostCountTypeEnum.fromJson(json[r'count_type']),
        displayType: RequestEventsPostDisplayTypeEnum.fromJson(json[r'display_type']),
        image: json[r'image'],
        eventDate: json[r'event_date'],
    );

  static List<RequestEventsPost> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventsPost>[]
      : json.map((dynamic value) => RequestEventsPost.fromJson(value)).toList(growable: true == growable);

  static Map<String, RequestEventsPost> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RequestEventsPost>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = RequestEventsPost.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RequestEventsPost-objects as value to a dart map
  static Map<String, List<RequestEventsPost>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RequestEventsPost>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = RequestEventsPost.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

/// カウントタイプ（progress:経過、left:残り）
class RequestEventsPostCountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestEventsPostCountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const progress = RequestEventsPostCountTypeEnum._(r'progress');
  static const left = RequestEventsPostCountTypeEnum._(r'left');

  /// List of all possible values in this [enum][RequestEventsPostCountTypeEnum].
  static const values = <RequestEventsPostCountTypeEnum>[
    progress,
    left,
  ];

  static RequestEventsPostCountTypeEnum fromJson(dynamic value) =>
    RequestEventsPostCountTypeEnumTypeTransformer().decode(value);

  static List<RequestEventsPostCountTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventsPostCountTypeEnum>[]
      : json
          .map((value) => RequestEventsPostCountTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [RequestEventsPostCountTypeEnum] to String,
/// and [decode] dynamic data back to [RequestEventsPostCountTypeEnum].
class RequestEventsPostCountTypeEnumTypeTransformer {
  const RequestEventsPostCountTypeEnumTypeTransformer._();

  factory RequestEventsPostCountTypeEnumTypeTransformer() => _instance ??= RequestEventsPostCountTypeEnumTypeTransformer._();

  String encode(RequestEventsPostCountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestEventsPostCountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestEventsPostCountTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'progress': return RequestEventsPostCountTypeEnum.progress;
      case r'left': return RequestEventsPostCountTypeEnum.left;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [RequestEventsPostCountTypeEnumTypeTransformer] instance.
  static RequestEventsPostCountTypeEnumTypeTransformer _instance;
}

/// 表示形式（day:日、time:日時）
class RequestEventsPostDisplayTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestEventsPostDisplayTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const day = RequestEventsPostDisplayTypeEnum._(r'day');
  static const time = RequestEventsPostDisplayTypeEnum._(r'time');

  /// List of all possible values in this [enum][RequestEventsPostDisplayTypeEnum].
  static const values = <RequestEventsPostDisplayTypeEnum>[
    day,
    time,
  ];

  static RequestEventsPostDisplayTypeEnum fromJson(dynamic value) =>
    RequestEventsPostDisplayTypeEnumTypeTransformer().decode(value);

  static List<RequestEventsPostDisplayTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventsPostDisplayTypeEnum>[]
      : json
          .map((value) => RequestEventsPostDisplayTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [RequestEventsPostDisplayTypeEnum] to String,
/// and [decode] dynamic data back to [RequestEventsPostDisplayTypeEnum].
class RequestEventsPostDisplayTypeEnumTypeTransformer {
  const RequestEventsPostDisplayTypeEnumTypeTransformer._();

  factory RequestEventsPostDisplayTypeEnumTypeTransformer() => _instance ??= RequestEventsPostDisplayTypeEnumTypeTransformer._();

  String encode(RequestEventsPostDisplayTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestEventsPostDisplayTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestEventsPostDisplayTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'day': return RequestEventsPostDisplayTypeEnum.day;
      case r'time': return RequestEventsPostDisplayTypeEnum.time;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [RequestEventsPostDisplayTypeEnumTypeTransformer] instance.
  static RequestEventsPostDisplayTypeEnumTypeTransformer _instance;
}

