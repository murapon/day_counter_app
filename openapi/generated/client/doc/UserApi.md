# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:31180*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postUser**](UserApi.md#postuser) | **POST** /user | ユーザー登録
[**postUserJwtKey**](UserApi.md#postuserjwtkey) | **POST** /user/jwt_key | JWTキー生成


# **postUser**
> ResponseUserPost postUser(xAppType, xAppVersion, xOsVersion)

ユーザー登録

ユーザーを作成し、uuid等を返す

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = UserApi();
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン

try { 
    final result = api_instance.postUser(xAppType, xAppVersion, xOsVersion);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->postUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 

### Return type

[**ResponseUserPost**](ResponseUserPost.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUserJwtKey**
> ResponseJwtKeyPost postUserJwtKey(xAppType, xAppVersion, xOsVersion, requestJwtKeyPost)

JWTキー生成

JWTキーを生成する

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = UserApi();
final xAppType = xAppType_example; // String | アプリタイプ
final xAppVersion = xAppVersion_example; // String | アプリバージョン
final xOsVersion = xOsVersion_example; // String | OSバージョン
final requestJwtKeyPost = RequestJwtKeyPost(); // RequestJwtKeyPost | 

try { 
    final result = api_instance.postUserJwtKey(xAppType, xAppVersion, xOsVersion, requestJwtKeyPost);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->postUserJwtKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xAppType** | **String**| アプリタイプ | 
 **xAppVersion** | **String**| アプリバージョン | 
 **xOsVersion** | **String**| OSバージョン | 
 **requestJwtKeyPost** | [**RequestJwtKeyPost**](RequestJwtKeyPost.md)|  | [optional] 

### Return type

[**ResponseJwtKeyPost**](ResponseJwtKeyPost.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

