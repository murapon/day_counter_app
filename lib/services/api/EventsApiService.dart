import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:openapi/api.dart';
import 'dart:io';

import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/entity/DeviceInfoEntity.dart';
import 'package:time_counter_app/storage/SpAccount.dart';

class EventsApiService {
  Future<ResponseEventsGet> getEvents(int limit, int offset) async {
    print("EventsApiService.getEvents START");
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();

    AccountEntity accountEntity = new AccountEntity();
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
    var eventsApi = EventsApi(client);
    var response = await eventsApi.getEventsWithHttpInfo(Platform.operatingSystem, '1.0.0',
      deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey(),
      limit: limit, offset: offset);
    if (response.statusCode == HttpStatus.unauthorized) {
      // jwt取得
      print("jwt取得");
      var userApi = UserApi(client);
      RequestJwtKeyPost requestJwtKeyPost = new RequestJwtKeyPost(uuid: accountEntity.getUuid(), password: accountEntity.getPassword());
      ResponseJwtKeyPost responseJwtKeyPost = await userApi.postUserJwtKey(
            Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(),
            requestJwtKeyPost: requestJwtKeyPost);
      var spDevice = new SpAccount();
      await spDevice.setJwtKey(responseJwtKeyPost.jwtKey);
      accountEntity.setAccount('jwtKey', responseJwtKeyPost.jwtKey);
      await getEvents(limit, offset);
    } else if (response.body != null && response.statusCode != HttpStatus.noContent) {
      print(jsonDecode(response.body));
      ResponseEventsGet a = ResponseEventsGet.fromJson(jsonDecode(response.body));
print("EventsApiService.getEvents END");
      return  a;
    }
    return Future<ResponseEventsGet>.value(null);
  }
}
