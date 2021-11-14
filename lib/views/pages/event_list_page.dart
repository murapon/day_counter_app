import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:http/http.dart';
import 'package:time_counter_app/services/EventsService.dart';
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
//  var eventList = ['イベントA', 'イベントB', 'イベントC'];

  @override
  Widget build(BuildContext context) {
/*
    //    var uuid = null;
    // 初回起動処理
    // ローカルにuuidがあるか確認になければ発行する
    var spAccount = new SpAccount();
//    Map account = spAccount.getAccount() as Map;
    Map account;
    spAccount.getAccount().then((value) {
      account = value;
      print('uuid');
      print(value['uuid']);
      if (value['uuid'] == null) {
        // アカウント発行APIを実行し、shared_preferencesに値を保存する
        var postUserApi = new PostUserApi();
        postUserApi.getUser().then((value) {
          ResponseUserPost user = value;
          spAccount.setAccount(user.uuid, user.password, user.jwtKey);
          uuid = user.uuid;
        });
        // イベント一覧取得

      } else {
        // イベント一覧

        // jwtkeyエラーなら、ログインし直し
        // イベント一覧再実行


      }
    });
*/
    // アカウントチェック









    return Scaffold(
      appBar: AppBar(
        title: Text("イベント"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: getList(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (!snapshot.hasData) {
            return Text("データを取得中");
          }

          if (snapshot.data.length == 0) {
            return Text("データが存在しませんでした。");
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
                    title: Text(snapshot.data[index]),
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
            itemCount: snapshot.data.length,
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

  Future<List<String>> getList() async {
    var eventsService = new EventsService();
    // イベント一覧取得
    eventsService.getList(10, 0).then((value) {


/*
          });
        });
      } else {
        // イベント一覧
        // jwtkeyエラーなら、ログインし直し
        // イベント一覧再実行
      }
*/
    });
    List<String> eventList = ['イベントA', 'イベントB', 'イベントC'];
    return eventList;
  }
}
