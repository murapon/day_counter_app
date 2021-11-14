//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseEventsGet {
  /// Returns a new [ResponseEventsGet] instance.
  ResponseEventsGet({
    this.list = const [],
    @required this.totalCount,
    this.nextOffset,
  });

  List<ResponseEventsGetList> list;

  /// 総件数
  int totalCount;

  /// 次のoffset
  int nextOffset;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseEventsGet &&
     other.list == list &&
     other.totalCount == totalCount &&
     other.nextOffset == nextOffset;

  @override
  int get hashCode =>
    (list == null ? 0 : list.hashCode) +
    (totalCount == null ? 0 : totalCount.hashCode) +
    (nextOffset == null ? 0 : nextOffset.hashCode);

  @override
  String toString() => 'ResponseEventsGet[list=$list, totalCount=$totalCount, nextOffset=$nextOffset]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'list'] = list;
      json[r'total_count'] = totalCount;
    if (nextOffset != null) {
      json[r'next_offset'] = nextOffset;
    }
    return json;
  }

  /// Returns a new [ResponseEventsGet] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseEventsGet fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseEventsGet(
        list: ResponseEventsGetList.listFromJson(json[r'list']),
        totalCount: json[r'total_count'],
        nextOffset: json[r'next_offset'],
    );

  static List<ResponseEventsGet> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseEventsGet>[]
      : json.map((dynamic value) => ResponseEventsGet.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseEventsGet> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseEventsGet>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseEventsGet.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseEventsGet-objects as value to a dart map
  static Map<String, List<ResponseEventsGet>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseEventsGet>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseEventsGet.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

