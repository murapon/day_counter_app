//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestEventPut {
  /// Returns a new [RequestEventPut] instance.
  RequestEventPut({
    this.title,
    this.eventDate,
    this.eventTime,
    this.countType,
    this.displayType,
    this.image,
    this.isDeleteImage,
  });

  /// イベントタイトル
  String title;

  /// イベン日付
  String eventDate;

  /// イベント時間
  String eventTime;

  /// カウントタイプ（progress:経過、left:残り）
  RequestEventPutCountTypeEnum countType;

  /// 表示形式（day:日、time:日時）
  RequestEventPutDisplayTypeEnum displayType;

  /// base64エンコードした画像データ
  String image;

  /// 画像の削除有無
  bool isDeleteImage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestEventPut &&
     other.title == title &&
     other.eventDate == eventDate &&
     other.eventTime == eventTime &&
     other.countType == countType &&
     other.displayType == displayType &&
     other.image == image &&
     other.isDeleteImage == isDeleteImage;

  @override
  int get hashCode =>
    (title == null ? 0 : title.hashCode) +
    (eventDate == null ? 0 : eventDate.hashCode) +
    (eventTime == null ? 0 : eventTime.hashCode) +
    (countType == null ? 0 : countType.hashCode) +
    (displayType == null ? 0 : displayType.hashCode) +
    (image == null ? 0 : image.hashCode) +
    (isDeleteImage == null ? 0 : isDeleteImage.hashCode);

  @override
  String toString() => 'RequestEventPut[title=$title, eventDate=$eventDate, eventTime=$eventTime, countType=$countType, displayType=$displayType, image=$image, isDeleteImage=$isDeleteImage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (title != null) {
      json[r'title'] = title;
    }
    if (eventDate != null) {
      json[r'event_date'] = eventDate;
    }
    if (eventTime != null) {
      json[r'event_time'] = eventTime;
    }
    if (countType != null) {
      json[r'count_type'] = countType;
    }
    if (displayType != null) {
      json[r'display_type'] = displayType;
    }
    if (image != null) {
      json[r'image'] = image;
    }
    if (isDeleteImage != null) {
      json[r'is_delete_image'] = isDeleteImage;
    }
    return json;
  }

  /// Returns a new [RequestEventPut] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RequestEventPut fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RequestEventPut(
        title: json[r'title'],
        eventDate: json[r'event_date'],
        eventTime: json[r'event_time'],
        countType: RequestEventPutCountTypeEnum.fromJson(json[r'count_type']),
        displayType: RequestEventPutDisplayTypeEnum.fromJson(json[r'display_type']),
        image: json[r'image'],
        isDeleteImage: json[r'is_delete_image'],
    );

  static List<RequestEventPut> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventPut>[]
      : json.map((dynamic value) => RequestEventPut.fromJson(value)).toList(growable: true == growable);

  static Map<String, RequestEventPut> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RequestEventPut>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = RequestEventPut.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RequestEventPut-objects as value to a dart map
  static Map<String, List<RequestEventPut>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RequestEventPut>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = RequestEventPut.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

/// カウントタイプ（progress:経過、left:残り）
class RequestEventPutCountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestEventPutCountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const progress = RequestEventPutCountTypeEnum._(r'progress');
  static const left = RequestEventPutCountTypeEnum._(r'left');

  /// List of all possible values in this [enum][RequestEventPutCountTypeEnum].
  static const values = <RequestEventPutCountTypeEnum>[
    progress,
    left,
  ];

  static RequestEventPutCountTypeEnum fromJson(dynamic value) =>
    RequestEventPutCountTypeEnumTypeTransformer().decode(value);

  static List<RequestEventPutCountTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventPutCountTypeEnum>[]
      : json
          .map((value) => RequestEventPutCountTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [RequestEventPutCountTypeEnum] to String,
/// and [decode] dynamic data back to [RequestEventPutCountTypeEnum].
class RequestEventPutCountTypeEnumTypeTransformer {
  const RequestEventPutCountTypeEnumTypeTransformer._();

  factory RequestEventPutCountTypeEnumTypeTransformer() => _instance ??= RequestEventPutCountTypeEnumTypeTransformer._();

  String encode(RequestEventPutCountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestEventPutCountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestEventPutCountTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'progress': return RequestEventPutCountTypeEnum.progress;
      case r'left': return RequestEventPutCountTypeEnum.left;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [RequestEventPutCountTypeEnumTypeTransformer] instance.
  static RequestEventPutCountTypeEnumTypeTransformer _instance;
}

/// 表示形式（day:日、time:日時）
class RequestEventPutDisplayTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestEventPutDisplayTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const day = RequestEventPutDisplayTypeEnum._(r'day');
  static const time = RequestEventPutDisplayTypeEnum._(r'time');

  /// List of all possible values in this [enum][RequestEventPutDisplayTypeEnum].
  static const values = <RequestEventPutDisplayTypeEnum>[
    day,
    time,
  ];

  static RequestEventPutDisplayTypeEnum fromJson(dynamic value) =>
    RequestEventPutDisplayTypeEnumTypeTransformer().decode(value);

  static List<RequestEventPutDisplayTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestEventPutDisplayTypeEnum>[]
      : json
          .map((value) => RequestEventPutDisplayTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [RequestEventPutDisplayTypeEnum] to String,
/// and [decode] dynamic data back to [RequestEventPutDisplayTypeEnum].
class RequestEventPutDisplayTypeEnumTypeTransformer {
  const RequestEventPutDisplayTypeEnumTypeTransformer._();

  factory RequestEventPutDisplayTypeEnumTypeTransformer() => _instance ??= RequestEventPutDisplayTypeEnumTypeTransformer._();

  String encode(RequestEventPutDisplayTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestEventPutDisplayTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestEventPutDisplayTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'day': return RequestEventPutDisplayTypeEnum.day;
      case r'time': return RequestEventPutDisplayTypeEnum.time;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [RequestEventPutDisplayTypeEnumTypeTransformer] instance.
  static RequestEventPutDisplayTypeEnumTypeTransformer _instance;
}

