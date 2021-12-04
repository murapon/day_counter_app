import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:time_counter_app/services/api/EventsApiService.dart';

class EventDetailPage extends StatefulWidget {
  final arguments;

  EventDetailPage({this.arguments});

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  Map _request;

  void initState() {
    super.initState();
    _request = Map<String, dynamic>.from(widget.arguments);
    print(_request);
  }

  @override
  Widget build(BuildContext context) {
    print('EventDetailPage start');
    print(_request['event_id']);

    return Scaffold(
        appBar: AppBar(
          title: Text("イベント詳細"),
        ),
        body: Container(
            child: FutureBuilder(
                future: _getEvent(_request['event_id'].toString()),
                builder: (BuildContext context, AsyncSnapshot<ResponseEventsDetailGet> snapshot) {
                  if (snapshot.hasData == false) {
                    return Text("データが存在しません");
                  }
                  print(snapshot.data);
                  return Container(
                      child: new Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  label: const Text('シェア'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  label: const Text('変更する'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  label: const Text('削除する'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ])
                        ]),
                  ));
                })));
  }

  // ignore: missing_return
  Future<ResponseEventsDetailGet> _getEvent($eventId) async {
    try {
      var eventsApiService = new EventsApiService();
      // イベント一覧取得
      print("_getEvent");
      var eventData = await eventsApiService.getEvent($eventId);
      return eventData;
    } catch (e) {
      print(e.toString());
    }
  }
//  void _onPressed() {}
}
