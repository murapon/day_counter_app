//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseJwtKeyPost {
  /// Returns a new [ResponseJwtKeyPost] instance.
  ResponseJwtKeyPost({
    @required this.jwtKey,
  });

  /// JWTキー
  String jwtKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseJwtKeyPost &&
     other.jwtKey == jwtKey;

  @override
  int get hashCode =>
    (jwtKey == null ? 0 : jwtKey.hashCode);

  @override
  String toString() => 'ResponseJwtKeyPost[jwtKey=$jwtKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'jwt_key'] = jwtKey;
    return json;
  }

  /// Returns a new [ResponseJwtKeyPost] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseJwtKeyPost fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseJwtKeyPost(
        jwtKey: json[r'jwt_key'],
    );

  static List<ResponseJwtKeyPost> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseJwtKeyPost>[]
      : json.map((dynamic value) => ResponseJwtKeyPost.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseJwtKeyPost> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseJwtKeyPost>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseJwtKeyPost.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseJwtKeyPost-objects as value to a dart map
  static Map<String, List<ResponseJwtKeyPost>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseJwtKeyPost>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseJwtKeyPost.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

