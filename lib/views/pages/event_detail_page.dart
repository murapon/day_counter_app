import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({
    Key key,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  var eventList = ['イベントA', 'イベントB', 'イベントC'];

  @override
  Widget build(BuildContext context) {
print('EventDetailPage start');

    return Scaffold(
      appBar: AppBar(
        title: Text("イベント詳細"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.red)),
//              width: size.width,
//              height: resultAreaHeight,
              child: Text(
                '画像表示',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black),
//              width: size.width,
//              height: tenkeyAreaHeight,
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
            ),
          ],
        ),
      ),
    );
  }

//  void _onPressed() {}
}
