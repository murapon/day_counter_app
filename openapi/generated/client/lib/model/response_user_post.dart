//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseUserPost {
  /// Returns a new [ResponseUserPost] instance.
  ResponseUserPost({
    @required this.uuid,
    @required this.password,
    @required this.jwtKey,
  });

  /// UUID
  String uuid;

  /// パスワード
  String password;

  /// JWTキー
  String jwtKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseUserPost &&
     other.uuid == uuid &&
     other.password == password &&
     other.jwtKey == jwtKey;

  @override
  int get hashCode =>
    (uuid == null ? 0 : uuid.hashCode) +
    (password == null ? 0 : password.hashCode) +
    (jwtKey == null ? 0 : jwtKey.hashCode);

  @override
  String toString() => 'ResponseUserPost[uuid=$uuid, password=$password, jwtKey=$jwtKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'uuid'] = uuid;
      json[r'password'] = password;
      json[r'jwt_key'] = jwtKey;
    return json;
  }

  /// Returns a new [ResponseUserPost] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseUserPost fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseUserPost(
        uuid: json[r'uuid'],
        password: json[r'password'],
        jwtKey: json[r'jwt_key'],
    );

  static List<ResponseUserPost> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseUserPost>[]
      : json.map((dynamic value) => ResponseUserPost.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseUserPost> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseUserPost>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseUserPost.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseUserPost-objects as value to a dart map
  static Map<String, List<ResponseUserPost>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseUserPost>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseUserPost.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

