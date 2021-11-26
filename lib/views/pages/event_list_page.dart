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
  Future<ResponseEventsGet> eventList = null;

  @override
  Widget build(BuildContext context) {
    print('EventListPage START');

/*
    print("getList  test-------------");
    // 初期設定：アプリID取得
    var spDevice = new SpAccount();
    spDevice.getAccount();
    AccountEntity accountEntity = new AccountEntity();
    print("event_list_page123 uuid");
    print(accountEntity.getUuid());
    if (accountEntity.getUuid() == null) {
      var userApiService = new UserApiService();
      userApiService.getUser();
    }
    print("test-------------1");
    var eventsApiService = new EventsApiService();
    print("test-------------2");
    // イベント一覧取得
    eventList = eventsApiService.getEvents(10, 0);
    print("test-------------3");
*/

    return Scaffold(
      appBar: AppBar(
        title: Text("イベント"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: _getList(),
        builder: (BuildContext context, AsyncSnapshot<ResponseEventsGet> snapshot) {
          print("EventListPage builder START");
          if (!snapshot.hasData) {
            print("EventListPage builder NO DATA");
            return Text("データを取得中");
          }
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38),
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.flight_land),
                    title: Text(snapshot.data.list[index].title),
                    subtitle: Text('2021/10/09 00:00:00'),
                    onTap: () {
                      Navigator.pushNamed(context, '/event_detail');
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => EventDetailPage()),
//                  );
                    },
                  ));
            },
            itemCount: snapshot.data.totalCount,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/event_register');
        },
      ),
    );
  }

  Future<ResponseEventsGet> _getList() async  {
print("EventListPage getList START");
    // 初期設定：アプリID取得
    var spDevice = new SpAccount();
    spDevice.getAccount();
    AccountEntity accountEntity = new AccountEntity();
    print(accountEntity.getUuid());
    if (accountEntity.getUuid() == null) {
      var userApiService = new UserApiService();
      await userApiService.getUser();
    }
    var eventsApiService = new EventsApiService();
    // イベント一覧取得
    var a =  await eventsApiService.getEvents(10, 0);
print("EventListPage getList RETURN");
    return a;
  }
}
