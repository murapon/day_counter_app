import 'package:openapi/api.dart';
import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/storage/SpAccount.dart';

import 'api/EventsApiService.dart';
import 'api/UserApiService.dart';

class EventsService {
  Future<List<String>> getList(int limit, int offset) async {
    List<String> eventList = ['イベントD', 'イベントF', 'イベントG'];

    var eventsApiService = new EventsApiService();
    Future<ResponseEventsGet> responseEventsGet = eventsApiService.getEvents(limit, offset);
    print(responseEventsGet.toString());
//    eventsApiService.getEvents().then((value) {
//       ResponseUserPost user = value;
//            spAccount.setAccount(user.uuid, user.password, user.jwtKey);
      // イベント一覧
      // jwtkeyエラーなら、ログインし直し
      // イベント一覧再実行
//print(value);
//    }
//    return eventList;

//    return eventList;
  }
}
