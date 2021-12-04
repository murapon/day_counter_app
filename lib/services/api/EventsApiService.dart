import 'dart:convert';

import 'package:openapi/api.dart';
import 'dart:io';

import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/entity/DeviceInfoEntity.dart';
import 'package:time_counter_app/storage/SpAccount.dart';

class EventsApiService {
  // ignore: missing_return
  Future<ResponseEventsGet> getEvents(int limit, int offset) async {
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();
    AccountEntity accountEntity = new AccountEntity();
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
    var eventsApi = EventsApi(client);
    var response = await eventsApi.getEventsWithHttpInfo(Platform.operatingSystem, '1.0.0',
        deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey(),
        limit: limit, offset: offset);
    if (response.statusCode == HttpStatus.unauthorized) {
      // jwt取得
      var userApi = UserApi(client);
      RequestJwtKeyPost requestJwtKeyPost = new RequestJwtKeyPost(uuid: accountEntity.getUuid(), password: accountEntity.getPassword());
      ResponseJwtKeyPost responseJwtKeyPost = await userApi.postUserJwtKey(
          Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(),
          requestJwtKeyPost: requestJwtKeyPost);
      var spDevice = new SpAccount();
      await spDevice.setJwtKey(responseJwtKeyPost.jwtKey);
      accountEntity.setAccount('jwtKey', responseJwtKeyPost.jwtKey);
      // 再度取得
      response = await eventsApi.getEventsWithHttpInfo(Platform.operatingSystem, '1.0.0',
          deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey(),
          limit: limit, offset: offset);
      return ResponseEventsGet.fromJson(jsonDecode(response.body));
    } else if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return ResponseEventsGet.fromJson(jsonDecode(response.body));
    }
  }

  Future<ResponseEventsDetailGet> getEvent(String eventId) async {
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();
    AccountEntity accountEntity = new AccountEntity();
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
    var eventsApi = EventsApi(client);
    print("test0");
    var response = await eventsApi.getEventsEventIdWithHttpInfo(eventId, Platform.operatingSystem, '1.0.0',
        deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey());

    print("test1");
print(response);

    if (response.statusCode == HttpStatus.unauthorized) {
      print("test2");
      // jwt取得
      var userApi = UserApi(client);
      RequestJwtKeyPost requestJwtKeyPost = new RequestJwtKeyPost(uuid: accountEntity.getUuid(), password: accountEntity.getPassword());
      ResponseJwtKeyPost responseJwtKeyPost = await userApi.postUserJwtKey(
          Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(),
          requestJwtKeyPost: requestJwtKeyPost);
      var spDevice = new SpAccount();
      await spDevice.setJwtKey(responseJwtKeyPost.jwtKey);
      accountEntity.setAccount('jwtKey', responseJwtKeyPost.jwtKey);
      // 再度取得
      var response = await eventsApi.getEventsEventIdWithHttpInfo(eventId, Platform.operatingSystem, '1.0.0',
          deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey());
      return ResponseEventsDetailGet.fromJson(jsonDecode(response.body));
    } else if (response.body != null && response.statusCode != HttpStatus.noContent) {
      print("test3");
      print(response.body);
      return ResponseEventsDetailGet.fromJson(jsonDecode(response.body));
    }
  }
}

