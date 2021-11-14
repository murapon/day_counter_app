import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:openapi/api.dart';
import 'dart:io';

import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/entity/DeviceInfoEntity.dart';

class EventsApiService {
  Future<ResponseEventsGet> getEvents(int limit, int offset) async {
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();

    AccountEntity accountEntity = new AccountEntity();
    var uuid = accountEntity.getUuid();
    print("EventsApiService uuid");
    print(uuid);

    var client = ApiClient(basePath: "http://10.0.2.2:31180");
// ヘッダを追加したい場合はクライアントに設定可能
//    client.addDefaultHeader("x-app-type", deviceInfoEntity.getOsVersion());

// ② APIクライアントラッパーを生成
// APIレスポンスをモデルに変換してくれる
    var eventsApi = EventsApi(client);

// ③ レスポンスボディのみが欲しい場合は${パス名+HTTPメッソド名}のメソッドをcall

    print(deviceInfoEntity.getOsVersion());
//    ResponseEventsGet events = ResponseEventsGet(totalCount: null);
    var response = null;
    if (uuid != null) {

      print(Platform.operatingSystem);
      print(deviceInfoEntity.getOsVersion());
      print(accountEntity.getJwtKey());

      var response = await eventsApi.getEventsWithHttpInfo(
          Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(), accountEntity.getJwtKey(),
          limit: limit, offset: offset);
      print(response.statusCode);
      print(response.toString());
//      print(response.body);
      print(jsonDecode(response.body));

      print("test1");
//        print(events.toJson());
      if(response.statusCode == HttpStatus.unauthorized) {
        // jwt取得
        print("jwt取得");
        var userApi = UserApi(client);
        RequestJwtKeyPost requestJwtKeyPost = new RequestJwtKeyPost(uuid: uuid, password: accountEntity.getPassword());
        ResponseJwtKeyPost responseJwtKeyPost = await userApi.postUserJwtKey(
            Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(),
            requestJwtKeyPost: requestJwtKeyPost);
        accountEntity.setAccount('jwtKey', responseJwtKeyPost.jwtKey);
        getEvents(limit, offset);
      }
      if (response.body != null && response.statusCode != HttpStatus.noContent) {
        return ResponseEventsGet.fromJson(jsonDecode(response.body));
      }
    }

//      print(events.list);
    return Future<ResponseEventsGet>.value(null);
  }
}
