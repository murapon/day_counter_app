//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseEventDetailGet {
  /// Returns a new [ResponseEventDetailGet] instance.
  ResponseEventDetailGet({
    @required this.id,
    @required this.title,
    @required this.eventDate,
    this.eventTime,
    @required this.countType,
    @required this.displayType,
    this.directoryName,
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
  ResponseEventDetailGetCountTypeEnum countType;

  /// 表示タイプ（day:日付、time:日時）
  ResponseEventDetailGetDisplayTypeEnum displayType;

  /// ディレクトリ名
  String directoryName;

  /// 画像ファイル名
  String imageName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseEventDetailGet &&
     other.id == id &&
     other.title == title &&
     other.eventDate == eventDate &&
     other.eventTime == eventTime &&
     other.countType == countType &&
     other.displayType == displayType &&
     other.directoryName == directoryName &&
     other.imageName == imageName;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (title == null ? 0 : title.hashCode) +
    (eventDate == null ? 0 : eventDate.hashCode) +
    (eventTime == null ? 0 : eventTime.hashCode) +
    (countType == null ? 0 : countType.hashCode) +
    (displayType == null ? 0 : displayType.hashCode) +
    (directoryName == null ? 0 : directoryName.hashCode) +
    (imageName == null ? 0 : imageName.hashCode);

  @override
  String toString() => 'ResponseEventDetailGet[id=$id, title=$title, eventDate=$eventDate, eventTime=$eventTime, countType=$countType, displayType=$displayType, directoryName=$directoryName, imageName=$imageName]';

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
    if (directoryName != null) {
      json[r'directory_name'] = directoryName;
    }
    if (imageName != null) {
      json[r'image_name'] = imageName;
    }
    return json;
  }

  /// Returns a new [ResponseEventDetailGet] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseEventDetailGet fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseEventDetailGet(
        id: json[r'id'],
        title: json[r'title'],
        eventDate: json[r'event_date'],
        eventTime: json[r'event_time'],
        countType: ResponseEventDetailGetCountTypeEnum.fromJson(json[r'count_type']),
        displayType: ResponseEventDetailGetDisplayTypeEnum.fromJson(json[r'display_type']),
        directoryName: json[r'directory_name'],
        imageName: json[r'image_name'],
    );

  static List<ResponseEventDetailGet> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventDetailGet>[]
      : json.map((dynamic value) => ResponseEventDetailGet.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseEventDetailGet> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseEventDetailGet>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseEventDetailGet.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseEventDetailGet-objects as value to a dart map
  static Map<String, List<ResponseEventDetailGet>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseEventDetailGet>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseEventDetailGet.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

/// カウントタイプ（progress:経過、left:残り）
class ResponseEventDetailGetCountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ResponseEventDetailGetCountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const progress = ResponseEventDetailGetCountTypeEnum._(r'progress');
  static const left = ResponseEventDetailGetCountTypeEnum._(r'left');

  /// List of all possible values in this [enum][ResponseEventDetailGetCountTypeEnum].
  static const values = <ResponseEventDetailGetCountTypeEnum>[
    progress,
    left,
  ];

  static ResponseEventDetailGetCountTypeEnum fromJson(dynamic value) =>
    ResponseEventDetailGetCountTypeEnumTypeTransformer().decode(value);

  static List<ResponseEventDetailGetCountTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventDetailGetCountTypeEnum>[]
      : json
          .map((value) => ResponseEventDetailGetCountTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [ResponseEventDetailGetCountTypeEnum] to String,
/// and [decode] dynamic data back to [ResponseEventDetailGetCountTypeEnum].
class ResponseEventDetailGetCountTypeEnumTypeTransformer {
  const ResponseEventDetailGetCountTypeEnumTypeTransformer._();

  factory ResponseEventDetailGetCountTypeEnumTypeTransformer() => _instance ??= ResponseEventDetailGetCountTypeEnumTypeTransformer._();

  String encode(ResponseEventDetailGetCountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ResponseEventDetailGetCountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ResponseEventDetailGetCountTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'progress': return ResponseEventDetailGetCountTypeEnum.progress;
      case r'left': return ResponseEventDetailGetCountTypeEnum.left;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [ResponseEventDetailGetCountTypeEnumTypeTransformer] instance.
  static ResponseEventDetailGetCountTypeEnumTypeTransformer _instance;
}

/// 表示タイプ（day:日付、time:日時）
class ResponseEventDetailGetDisplayTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ResponseEventDetailGetDisplayTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const day = ResponseEventDetailGetDisplayTypeEnum._(r'day');
  static const time = ResponseEventDetailGetDisplayTypeEnum._(r'time');

  /// List of all possible values in this [enum][ResponseEventDetailGetDisplayTypeEnum].
  static const values = <ResponseEventDetailGetDisplayTypeEnum>[
    day,
    time,
  ];

  static ResponseEventDetailGetDisplayTypeEnum fromJson(dynamic value) =>
    ResponseEventDetailGetDisplayTypeEnumTypeTransformer().decode(value);

  static List<ResponseEventDetailGetDisplayTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventDetailGetDisplayTypeEnum>[]
      : json
          .map((value) => ResponseEventDetailGetDisplayTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [ResponseEventDetailGetDisplayTypeEnum] to String,
/// and [decode] dynamic data back to [ResponseEventDetailGetDisplayTypeEnum].
class ResponseEventDetailGetDisplayTypeEnumTypeTransformer {
  const ResponseEventDetailGetDisplayTypeEnumTypeTransformer._();

  factory ResponseEventDetailGetDisplayTypeEnumTypeTransformer() => _instance ??= ResponseEventDetailGetDisplayTypeEnumTypeTransformer._();

  String encode(ResponseEventDetailGetDisplayTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ResponseEventDetailGetDisplayTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ResponseEventDetailGetDisplayTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'day': return ResponseEventDetailGetDisplayTypeEnum.day;
      case r'time': return ResponseEventDetailGetDisplayTypeEnum.time;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [ResponseEventDetailGetDisplayTypeEnumTypeTransformer] instance.
  static ResponseEventDetailGetDisplayTypeEnumTypeTransformer _instance;
}

