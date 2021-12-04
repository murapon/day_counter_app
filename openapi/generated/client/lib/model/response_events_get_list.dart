//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseEventsGetList {
  /// Returns a new [ResponseEventsGetList] instance.
  ResponseEventsGetList({
    @required this.id,
    @required this.countType,
    @required this.title,
    @required this.eventTime,
  });

  /// イベントID
  int id;

  /// カウントタイプ（progress:経過、left:残り）
  ResponseEventsGetListCountTypeEnum countType;

  /// タイトル
  String title;

  /// イベント時間
  String eventTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseEventsGetList &&
     other.id == id &&
     other.countType == countType &&
     other.title == title &&
     other.eventTime == eventTime;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (countType == null ? 0 : countType.hashCode) +
    (title == null ? 0 : title.hashCode) +
    (eventTime == null ? 0 : eventTime.hashCode);

  @override
  String toString() => 'ResponseEventsGetList[id=$id, countType=$countType, title=$title, eventTime=$eventTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = id;
      json[r'count_type'] = countType;
      json[r'title'] = title;
      json[r'event_time'] = eventTime;
    return json;
  }

  /// Returns a new [ResponseEventsGetList] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseEventsGetList fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseEventsGetList(
        id: json[r'id'],
        countType: ResponseEventsGetListCountTypeEnum.fromJson(json[r'count_type']),
        title: json[r'title'],
        eventTime: json[r'event_time'],
    );

  static List<ResponseEventsGetList> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventsGetList>[]
      : json.map((dynamic value) => ResponseEventsGetList.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseEventsGetList> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseEventsGetList>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseEventsGetList.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseEventsGetList-objects as value to a dart map
  static Map<String, List<ResponseEventsGetList>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseEventsGetList>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseEventsGetList.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

/// カウントタイプ（progress:経過、left:残り）
class ResponseEventsGetListCountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ResponseEventsGetListCountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const progress = ResponseEventsGetListCountTypeEnum._(r'progress');
  static const left = ResponseEventsGetListCountTypeEnum._(r'left');

  /// List of all possible values in this [enum][ResponseEventsGetListCountTypeEnum].
  static const values = <ResponseEventsGetListCountTypeEnum>[
    progress,
    left,
  ];

  static ResponseEventsGetListCountTypeEnum fromJson(dynamic value) =>
    ResponseEventsGetListCountTypeEnumTypeTransformer().decode(value);

  static List<ResponseEventsGetListCountTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventsGetListCountTypeEnum>[]
      : json
          .map((value) => ResponseEventsGetListCountTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [ResponseEventsGetListCountTypeEnum] to String,
/// and [decode] dynamic data back to [ResponseEventsGetListCountTypeEnum].
class ResponseEventsGetListCountTypeEnumTypeTransformer {
  const ResponseEventsGetListCountTypeEnumTypeTransformer._();

  factory ResponseEventsGetListCountTypeEnumTypeTransformer() => _instance ??= ResponseEventsGetListCountTypeEnumTypeTransformer._();

  String encode(ResponseEventsGetListCountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ResponseEventsGetListCountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ResponseEventsGetListCountTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case r'progress': return ResponseEventsGetListCountTypeEnum.progress;
      case r'left': return ResponseEventsGetListCountTypeEnum.left;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [ResponseEventsGetListCountTypeEnumTypeTransformer] instance.
  static ResponseEventsGetListCountTypeEnumTypeTransformer _instance;
}

