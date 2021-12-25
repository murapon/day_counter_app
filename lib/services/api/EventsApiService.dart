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
      RequestJwtKeyPost requestJwtKeyPost =
      new RequestJwtKeyPost(uuid: accountEntity.getUuid(), password: accountEntity.getPassword());
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

  Future<ResponseEventDetailGet> getEvent(String eventId) async {
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();
    AccountEntity accountEntity = new AccountEntity();
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
    var eventsApi = EventsApi(client);
    var response = await eventsApi.getEventEventIdWithHttpInfo(eventId, Platform.operatingSystem, '1.0.0',
        deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey());
    if (response.statusCode == HttpStatus.unauthorized) {
      // jwt取得
      var userApi = UserApi(client);
      RequestJwtKeyPost requestJwtKeyPost =
      new RequestJwtKeyPost(uuid: accountEntity.getUuid(), password: accountEntity.getPassword());
      ResponseJwtKeyPost responseJwtKeyPost = await userApi.postUserJwtKey(
          Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(),
          requestJwtKeyPost: requestJwtKeyPost);
      var spDevice = new SpAccount();
      await spDevice.setJwtKey(responseJwtKeyPost.jwtKey);
      accountEntity.setAccount('jwtKey', responseJwtKeyPost.jwtKey);
      // 再度取得
      var response = await eventsApi.getEventEventIdWithHttpInfo(eventId, Platform.operatingSystem, '1.0.0',
          deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey());
      return ResponseEventDetailGet.fromJson(jsonDecode(response.body));
    } else if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return ResponseEventDetailGet.fromJson(jsonDecode(response.body));
    }
  }

  // ignore: missing_return
  Future<Map> updateEvent(String eventId, String title, String eventDate, String eventTime, int countType,
      int displayType, String image, bool isDeleteImage) async {
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();
    AccountEntity accountEntity = new AccountEntity();
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
    var eventsApi = EventsApi(client);
    RequestEventPutCountTypeEnum _requestCountType;
    RequestEventPutDisplayTypeEnum _requestDisplayType;
    if (countType == 1) {
      // 経過
      _requestCountType = RequestEventPutCountTypeEnum.progress;
    } else {
      // 残り
      _requestCountType = RequestEventPutCountTypeEnum.left;
    }
    if (displayType == 1) {
      // 日
      _requestDisplayType = RequestEventPutDisplayTypeEnum.day;
    } else {
      // 時間
      _requestDisplayType = RequestEventPutDisplayTypeEnum.time;
    }

    RequestEventPut requestEventsPut = new RequestEventPut(
      title: title,
      eventDate: eventDate,
      eventTime: eventTime,
      countType: _requestCountType,
      displayType: _requestDisplayType,
      image: image,
      isDeleteImage: isDeleteImage,
    );
    print(countType);
    print(RequestEventPutCountTypeEnum.progress);
    var response = await eventsApi.putEventEventIdWithHttpInfo(eventId, Platform.operatingSystem, '1.0.0',
        deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey(),
        requestEventPut: requestEventsPut);
    print("updateEvent");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == HttpStatus.unauthorized) {
      // jwt取得
      var userApi = UserApi(client);
      RequestJwtKeyPost requestJwtKeyPost =
      new RequestJwtKeyPost(uuid: accountEntity.getUuid(), password: accountEntity.getPassword());
      ResponseJwtKeyPost responseJwtKeyPost = await userApi.postUserJwtKey(
          Platform.operatingSystem, '1.0.0', deviceInfoEntity.getOsVersion(),
          requestJwtKeyPost: requestJwtKeyPost);
      var spDevice = new SpAccount();
      await spDevice.setJwtKey(responseJwtKeyPost.jwtKey);
      accountEntity.setAccount('jwtKey', responseJwtKeyPost.jwtKey);
      // 再度取得
      var response = await eventsApi.putEventEventIdWithHttpInfo(eventId, Platform.operatingSystem, '1.0.0',
          deviceInfoEntity.getOsVersion().toString(), accountEntity.getUuid(), accountEntity.getJwtKey(),
          requestEventPut: requestEventsPut);
      if(response.statusCode == HttpStatus.ok) {
        return {'success' : true, 'message' : '更新しました'};
      } else {
        var responseError = ResponseErrorMessages.fromJson(jsonDecode(response.body));
        return {'success' : false, 'message' : responseError.message};
      }
    } else if(response.statusCode == HttpStatus.ok) {
      return {'success' : true, 'message' : '更新しました'};
    } else {
      var responseError = ResponseErrorMessages.fromJson(jsonDecode(response.body));
      return {'success' : false, 'message' : responseError.message};
    }
  }
}


