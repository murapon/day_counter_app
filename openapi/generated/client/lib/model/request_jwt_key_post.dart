//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestJwtKeyPost {
  /// Returns a new [RequestJwtKeyPost] instance.
  RequestJwtKeyPost({
    @required this.uuid,
    @required this.password,
  });

  /// UUID
  String uuid;

  /// パスワード
  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestJwtKeyPost &&
     other.uuid == uuid &&
     other.password == password;

  @override
  int get hashCode =>
    (uuid == null ? 0 : uuid.hashCode) +
    (password == null ? 0 : password.hashCode);

  @override
  String toString() => 'RequestJwtKeyPost[uuid=$uuid, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'uuid'] = uuid;
      json[r'password'] = password;
    return json;
  }

  /// Returns a new [RequestJwtKeyPost] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RequestJwtKeyPost fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RequestJwtKeyPost(
        uuid: json[r'uuid'],
        password: json[r'password'],
    );

  static List<RequestJwtKeyPost> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RequestJwtKeyPost>[]
      : json.map((dynamic value) => RequestJwtKeyPost.fromJson(value)).toList(growable: true == growable);

  static Map<String, RequestJwtKeyPost> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RequestJwtKeyPost>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = RequestJwtKeyPost.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RequestJwtKeyPost-objects as value to a dart map
  static Map<String, List<RequestJwtKeyPost>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RequestJwtKeyPost>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = RequestJwtKeyPost.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

