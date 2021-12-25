import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/services/api/EventsApiService.dart';
import 'package:time_counter_app/services/api/UserApiService.dart';
import 'package:time_counter_app/storage/SpAccount.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({
    Key key,
  }) : super(key: key);

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List<Map> eventList = null;
  bool loading = false;
  int offset = 0;

  @override
  Widget build(BuildContext context) {
    var length = eventList?.length ?? 0;
    return Scaffold(
      appBar: AppBar(title: Text("無限スクロール")),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          if (index == length && offset != null) {
            _load();
            return new Center(
              child: new Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: 32.0,
                height: 32.0,
                child: const CircularProgressIndicator(),
              ),
            );
          } else if (index > length) {
            return null;
          }
          if (eventList.length > index) {
            var event = eventList[index];
            print(event['title']);
            print(event['id']);
            return Container(
                child: ListTile(
              leading: const Icon(Icons.flight_land),
              title: Text(event['title']),
              subtitle: Text(event['eventTime']),
              onTap: () {
                Navigator.pushNamed(context, '/event_detail',
                    arguments: {'event_id': event['id'], 'title': event['title']});
              },
            ));
          } else {
            return null;
          }
        },
      ),
    );
  }

  Future<void> _load() async {
    if (loading || offset == null) {
      return null;
    }
    loading = true;
    try {
      // 初期設定：アプリID取得
      var spDevice = new SpAccount();
      await spDevice.getAccount();
      AccountEntity accountEntity = new AccountEntity();
      if (accountEntity.getUuid() == null) {
        var userApiService = new UserApiService();
        await userApiService.getUser();
      }
      var eventsApiService = new EventsApiService();
      // イベント一覧取得
      var eventData = await eventsApiService.getEvents(10, offset);
      setState(() {
        offset = eventData.nextOffset;
        if (eventList == null) {
          eventList = <Map>[];
        }
        eventData.list.forEach((dynamic event) {
          eventList
              .add({'id': event.id as int, 'title': event.title as String, 'eventTime': event.eventTime as String});
        });
      });
    } catch (e) {
      print(e.toString());
    } finally {
      loading = false;
    }
  }
}
