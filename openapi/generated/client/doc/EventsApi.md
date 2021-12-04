# openapi.api.EventsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:31180*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteEventsEventId**](EventsApi.md#deleteeventseventid) | **DELETE** /event/{event_id} | イベント削除
[**getEvents**](EventsApi.md#getevents) | **GET** /events | イベント一覧取得
[**getEventsEventId**](EventsApi.md#geteventseventid) | **GET** /event/{event_id} | イベント詳細取得
[**postEvents**](EventsApi.md#postevents) | **POST** /events | イベント登録
[**putEventsEventId**](EventsApi.md#puteventseventid) | **PUT** /event/{event_id} | イベント変更


# **deleteEventsEventId**
> deleteEventsEventId(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2)

イベント削除

イベント削除

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = EventsApi();
final eventId = eventId_example; // String | 
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン
final xUuid = xUuid_example; // String | uuid
final xJwtKey = xJwtKey_example; // String | jwt key
final eventId2 = eventId_example; // String | イベントID

try { 
    api_instance.deleteEventsEventId(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2);
} catch (e) {
    print('Exception when calling EventsApi->deleteEventsEventId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 
 **xUuid** | **String**| uuid | 
 **xJwtKey** | **String**| jwt key | 
 **eventId2** | **String**| イベントID | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEvents**
> ResponseEventsGet getEvents(xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, limit, offset)

イベント一覧取得

イベント一覧取得

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = EventsApi();
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン
final xUuid = xUuid_example; // String | uuid
final xJwtKey = xJwtKey_example; // String | jwt key
final limit = 56; // int | limit
final offset = 56; // int | offset

try { 
    final result = api_instance.getEvents(xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling EventsApi->getEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 
 **xUuid** | **String**| uuid | 
 **xJwtKey** | **String**| jwt key | 
 **limit** | **int**| limit | [optional] 
 **offset** | **int**| offset | [optional] 

### Return type

[**ResponseEventsGet**](ResponseEventsGet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEventsEventId**
> ResponseEventsDetailGet getEventsEventId(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey)

イベント詳細取得

イベント詳細取得

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = EventsApi();
final eventId = eventId_example; // String | 
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン
final xUuid = xUuid_example; // String | uuid
final xJwtKey = xJwtKey_example; // String | jwt key

try { 
    final result = api_instance.getEventsEventId(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey);
    print(result);
} catch (e) {
    print('Exception when calling EventsApi->getEventsEventId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 
 **xUuid** | **String**| uuid | 
 **xJwtKey** | **String**| jwt key | 

### Return type

[**ResponseEventsDetailGet**](ResponseEventsDetailGet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postEvents**
> postEvents(xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, requestEventsPost)

イベント登録

イベント登録

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = EventsApi();
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン
final xUuid = xUuid_example; // String | uuid
final xJwtKey = xJwtKey_example; // String | jwt key
final requestEventsPost = RequestEventsPost(); // RequestEventsPost | イベント登録APIのリクエストモデル

try { 
    api_instance.postEvents(xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, requestEventsPost);
} catch (e) {
    print('Exception when calling EventsApi->postEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 
 **xUuid** | **String**| uuid | 
 **xJwtKey** | **String**| jwt key | 
 **requestEventsPost** | [**RequestEventsPost**](RequestEventsPost.md)| イベント登録APIのリクエストモデル | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putEventsEventId**
> putEventsEventId(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2, requestEventsPut)

イベント変更

イベント変更

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = EventsApi();
final eventId = eventId_example; // String | 
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン
final xUuid = xUuid_example; // String | uuid
final xJwtKey = xJwtKey_example; // String | jwt key
final eventId2 = eventId_example; // String | イベントID
final requestEventsPut = RequestEventsPut(); // RequestEventsPut | 

try { 
    api_instance.putEventsEventId(eventId, xAppType, xAppVersion, xOsVersion, xUuid, xJwtKey, eventId2, requestEventsPut);
} catch (e) {
    print('Exception when calling EventsApi->putEventsEventId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 
 **xUuid** | **String**| uuid | 
 **xJwtKey** | **String**| jwt key | 
 **eventId2** | **String**| イベントID | 
 **requestEventsPut** | [**RequestEventsPut**](RequestEventsPut.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

