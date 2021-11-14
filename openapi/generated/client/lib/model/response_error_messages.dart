//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseErrorMessages {
  /// Returns a new [ResponseErrorMessages] instance.
  ResponseErrorMessages({
    this.code,
    this.message,
  });

  /// エラーコード
  String code;

  /// エラーメッセージ
  String message;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseErrorMessages &&
     other.code == code &&
     other.message == message;

  @override
  int get hashCode =>
    (code == null ? 0 : code.hashCode) +
    (message == null ? 0 : message.hashCode);

  @override
  String toString() => 'ResponseErrorMessages[code=$code, message=$message]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (code != null) {
      json[r'code'] = code;
    }
    if (message != null) {
      json[r'message'] = message;
    }
    return json;
  }

  /// Returns a new [ResponseErrorMessages] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseErrorMessages fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseErrorMessages(
        code: json[r'code'],
        message: json[r'message'],
    );

  static List<ResponseErrorMessages> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseErrorMessages>[]
      : json.map((dynamic value) => ResponseErrorMessages.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseErrorMessages> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseErrorMessages>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseErrorMessages.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseErrorMessages-objects as value to a dart map
  static Map<String, List<ResponseErrorMessages>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseErrorMessages>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseErrorMessages.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

