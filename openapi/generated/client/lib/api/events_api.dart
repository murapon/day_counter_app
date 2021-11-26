//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class EventsApi {
  EventsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// イベント削除
  ///
  /// イベント削除
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [String] eventId2 (required):
  ///   イベントID
  Future<Response> deleteEventsEventIdWithHttpInfo(String eventId, String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, String eventId2) async {
    // Verify required params are set.
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }
    if (xAppType == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppType');
    }
    if (xAppVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppVersion');
    }
    if (xOsVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xOsVersion');
    }
    if (xUuid == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xUuid');
    }
    if (xJwtKey == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xJwtKey');
    }
    if (eventId2 == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId2');
    }

    final path = r'/events/{event_id}'
      .replaceAll('{' + 'event_id' + '}', eventId.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'event_id', eventId2));

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);
    headerParams[r'x-uuid'] = parameterToString(xUuid);
    headerParams[r'x-jwt-key'] = parameterToString(xJwtKey);

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// イベント削除
  ///
  /// イベント削除
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [String] eventId2 (required):
  ///   イベントID
  Future<void> deleteEventsEventId(String eventId, String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, String eventId2) async {
    final response = await deleteEventsEventIdWithHttpInfo(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// イベント一覧取得
  ///
  /// イベント一覧取得
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [int] limit:
  ///   limit
  ///
  /// * [int] offset:
  ///   offset
  Future<Response> getEventsWithHttpInfo(String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, { int limit, int offset }) async {
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
    if (xUuid == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xUuid');
    }
    if (xJwtKey == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xJwtKey');
    }

    final path = r'/events';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'offset', offset));
    }

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);
    headerParams[r'x-uuid'] = parameterToString(xUuid);
    headerParams[r'x-jwt-key'] = parameterToString(xJwtKey);

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// イベント一覧取得
  ///
  /// イベント一覧取得
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [int] limit:
  ///   limit
  ///
  /// * [int] offset:
  ///   offset
  Future<ResponseEventsGet> getEvents(String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, { int limit, int offset }) async {
    final response = await getEventsWithHttpInfo(xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey,  limit: limit, offset: offset );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseEventsGet',) as ResponseEventsGet;
        }
    return Future<ResponseEventsGet>.value(null);
  }

  /// イベント詳細取得
  ///
  /// イベント詳細取得
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [String] eventId2 (required):
  ///   イベントID
  Future<Response> getEventsEventIdWithHttpInfo(String eventId, String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, String eventId2) async {
    // Verify required params are set.
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }
    if (xAppType == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppType');
    }
    if (xAppVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppVersion');
    }
    if (xOsVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xOsVersion');
    }
    if (xUuid == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xUuid');
    }
    if (xJwtKey == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xJwtKey');
    }
    if (eventId2 == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId2');
    }

    final path = r'/events/{event_id}'
      .replaceAll('{' + 'event_id' + '}', eventId.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'event_id', eventId2));

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);
    headerParams[r'x-uuid'] = parameterToString(xUuid);
    headerParams[r'x-jwt-key'] = parameterToString(xJwtKey);

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// イベント詳細取得
  ///
  /// イベント詳細取得
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [String] eventId2 (required):
  ///   イベントID
  Future<ResponseEventsDetailGet> getEventsEventId(String eventId, String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, String eventId2) async {
    final response = await getEventsEventIdWithHttpInfo(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseEventsDetailGet',) as ResponseEventsDetailGet;
        }
    return Future<ResponseEventsDetailGet>.value(null);
  }

  /// イベント登録
  ///
  /// イベント登録
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [RequestEventsPost] requestEventsPost:
  ///   イベント登録APIのリクエストモデル
  Future<Response> postEventsWithHttpInfo(String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, { RequestEventsPost requestEventsPost }) async {
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
    if (xUuid == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xUuid');
    }
    if (xJwtKey == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xJwtKey');
    }

    final path = r'/events';

    Object postBody = requestEventsPost;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);
    headerParams[r'x-uuid'] = parameterToString(xUuid);
    headerParams[r'x-jwt-key'] = parameterToString(xJwtKey);

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

  /// イベント登録
  ///
  /// イベント登録
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [RequestEventsPost] requestEventsPost:
  ///   イベント登録APIのリクエストモデル
  Future<void> postEvents(String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, { RequestEventsPost requestEventsPost }) async {
    final response = await postEventsWithHttpInfo(xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey,  requestEventsPost: requestEventsPost );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// イベント変更
  ///
  /// イベント変更
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [String] eventId2 (required):
  ///   イベントID
  ///
  /// * [RequestEventsPut] requestEventsPut:
  Future<Response> putEventsEventIdWithHttpInfo(String eventId, String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, String eventId2, { RequestEventsPut requestEventsPut }) async {
    // Verify required params are set.
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }
    if (xAppType == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppType');
    }
    if (xAppVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xAppVersion');
    }
    if (xOsVersion == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xOsVersion');
    }
    if (xUuid == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xUuid');
    }
    if (xJwtKey == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: xJwtKey');
    }
    if (eventId2 == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId2');
    }

    final path = r'/events/{event_id}'
      .replaceAll('{' + 'event_id' + '}', eventId.toString());

    Object postBody = requestEventsPut;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'event_id', eventId2));

    headerParams[r'x-app-type'] = parameterToString(xAppType);
    headerParams[r'x-app-version'] = parameterToString(xAppVersion);
    headerParams[r'x-os-version'] = parameterToString(xOsVersion);
    headerParams[r'x-uuid'] = parameterToString(xUuid);
    headerParams[r'x-jwt-key'] = parameterToString(xJwtKey);

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// イベント変更
  ///
  /// イベント変更
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
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
  /// * [String] xUuid (required):
  ///   uuid
  ///
  /// * [String] xJwtKey (required):
  ///   jwt key
  ///
  /// * [String] eventId2 (required):
  ///   イベントID
  ///
  /// * [RequestEventsPut] requestEventsPut:
  Future<void> putEventsEventId(String eventId, String xAppType, String xAppVersion, String xOsVersion, String xUuid, String xJwtKey, String eventId2, { RequestEventsPut requestEventsPut }) async {
    final response = await putEventsEventIdWithHttpInfo(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2,  requestEventsPut: requestEventsPut );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
