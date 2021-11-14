//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseError {
  /// Returns a new [ResponseError] instance.
  ResponseError({
    this.messages = const [],
    this.newReleaseUrl,
  });

  /// エラーメッセージ。codeが0以外の場合はmessageに文字列を格納する。
  List<ResponseErrorMessages> messages;

  /// 強制バージョンアップ時のURL
  String newReleaseUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseError &&
     other.messages == messages &&
     other.newReleaseUrl == newReleaseUrl;

  @override
  int get hashCode =>
    (messages == null ? 0 : messages.hashCode) +
    (newReleaseUrl == null ? 0 : newReleaseUrl.hashCode);

  @override
  String toString() => 'ResponseError[messages=$messages, newReleaseUrl=$newReleaseUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (messages != null) {
      json[r'messages'] = messages;
    }
    if (newReleaseUrl != null) {
      json[r'new_release_url'] = newReleaseUrl;
    }
    return json;
  }

  /// Returns a new [ResponseError] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ResponseError fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ResponseError(
        messages: ResponseErrorMessages.listFromJson(json[r'messages']),
        newReleaseUrl: json[r'new_release_url'],
    );

  static List<ResponseError> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ResponseError>[]
      : json.map((dynamic value) => ResponseError.fromJson(value)).toList(growable: true == growable);

  static Map<String, ResponseError> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ResponseError>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ResponseError.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ResponseError-objects as value to a dart map
  static Map<String, List<ResponseError>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ResponseError>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ResponseError.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

