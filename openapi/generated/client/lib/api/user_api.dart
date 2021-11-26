//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// ユーザー登録
  ///
  /// ユーザーを作成し、uuid等を返す
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] xAppType (required):
  ///   アプリタイプ
  ///
  /// * [String] xAppVersion (required):
  ///   アプリバージョン
  ///
  /// * [String] xOsVersion (required):
  ///   OSバージョン
  Future<Response> postUserWithHttpInfo(String xAppType, String xAppVersion, String xOsVersion) async {
    // Verify required params are set.
    if (xAppType == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppType');
    }
    if (xAppVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppVersion');
    }
    if (xOsVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xOsVersion');
    }

    final path = r'/user';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// ユーザー登録
  ///
  /// ユーザーを作成し、uuid等を返す
  ///
  /// Parameters:
  ///
  /// * [String] xAppType (required):
  ///   アプリタイプ
  ///
  /// * [String] xAppVersion (required):
  ///   アプリバージョン
  ///
  /// * [String] xOsVersion (required):
  ///   OSバージョン
  Future<ResponseUserPost> postUser(String xAppType, String xAppVersion, String xOsVersion) async {
    final response = await postUserWithHttpInfo(xAppType, xAppVersion, xOsVersion);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseUserPost',) as ResponseUserPost;
        }
    return Future<ResponseUserPost>.value(null);
  }

  /// JWTキー生成
  ///
  /// JWTキーを生成する
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] xAppType (required):
  ///   アプリタイプ
  ///
  /// * [String] xAppVersion (required):
  ///   アプリバージョン
  ///
  /// * [String] xOsVersion (required):
  ///   OSバージョン
  ///
  /// * [RequestJwtKeyPost] requestJwtKeyPost:
  Future<Response> postUserJwtKeyWithHttpInfo(String xAppType, String xAppVersion, String xOsVersion, { RequestJwtKeyPost requestJwtKeyPost }) async {
    // Verify required params are set.
    if (xAppType == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppType');
    }
    if (xAppVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppVersion');
    }
    if (xOsVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xOsVersion');
    }

    final path = r'/user/jwt_key';

    Object postBody = requestJwtKeyPost;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// JWTキー生成
  ///
  /// JWTキーを生成する
  ///
  /// Parameters:
  ///
  /// * [String] xAppType (required):
  ///   アプリタイプ
  ///
  /// * [String] xAppVersion (required):
  ///   アプリバージョン
  ///
  /// * [String] xOsVersion (required):
  ///   OSバージョン
  ///
  /// * [RequestJwtKeyPost] requestJwtKeyPost:
  Future<ResponseJwtKeyPost> postUserJwtKey(String xAppType, String xAppVersion, String xOsVersion, { RequestJwtKeyPost requestJwtKeyPost }) async {
    final response = await postUserJwtKeyWithHttpInfo(xAppType, xAppVersion, xOsVersion,  requestJwtKeyPost: requestJwtKeyPost );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseJwtKeyPost',) as ResponseJwtKeyPost;
        }
    return Future<ResponseJwtKeyPost>.value(null);
  }
}
