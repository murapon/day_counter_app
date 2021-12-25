//import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import 'package:image/image.dart' as imgLib;
import 'package:openapi/api.dart';
import 'package:path_provider/path_provider.dart';
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
          title: Text(_request['title']),
        ),
        body: Container(
            child: FutureBuilder(
                future: _getEvent(_request['event_id'].toString()),
                builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                  if (snapshot.hasData == false) {
                    return Text("データ取得中");
                  }
                  print(snapshot.data);
                  print(snapshot.data['eventData'].title);
                  return Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        child: snapshot.data['eventImage'],
                        children: <Widget>[
//                          snapshot.data['eventImage'],
//                          Image.file(
//                            snapshot.data['eventImage'],
                          //                         ),
//                          Image(
//                            width: 200,
//                            image: FileImage(snapshot.data['eventImage']),
//                          ),
                          Image(image: MemoryImage(snapshot.data['eventImage'])),
//                    Image.file(
//                      snapshot.data['eventImage'],
//                        width: 100,
                          //                  ),
//                          .memory(),
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
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/event_update',
                                        arguments: {'event_id': _request['event_id']});
                                  },
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
                  );
                })));
  }

  // ignore: missing_return
  Future<Map> _getEvent($eventId) async {
    try {
      var eventsApiService = new EventsApiService();
      var image;
      Uint8List bytes;
      // イベント一覧取得
      print("_getEvent");
      var eventData = await eventsApiService.getEvent($eventId);
      if (eventData.imageName != null) {
        final Size size = MediaQuery.of(context).size;
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;
        String imgPath = appDocPath + '/img/' + eventData.imageName;

        print(imgPath);
        print(File(imgPath).exists());

//        if (File(imgPath).exists() == false) {
        final http.Response res = await http
            .get(Uri.parse('http://10.0.2.2:31180/img/' + eventData.directoryName + '/' + eventData.imageName));
        final file = File(imgPath);
        await file.create();
        await file.writeAsBytes(res.bodyBytes);
//        }

        print("test1");

        final recoder = ui.PictureRecorder();
        final canvas = Canvas(recoder);
        final paint = Paint()
          ..isAntiAlias = true;
        print("test2");
        //       final rawData = await rootBundle.load(imgPath);
//        imgLib.Image image = imgLib.decodeImage(File(imgPath).readAsBytesSync());

//        final imgList = Uint8List.view(rawData.buffer);
        final imgList = File(imgPath).readAsBytesSync();
        var img = await decodeImageFromList(imgList);

        final src = Rect.fromLTWH(0, 0, size.width, size.height);
        const dst = Rect.fromLTWH(0, 0, 300, 300);
        canvas.drawImageRect(img, src, dst, paint);

        const span = TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          text: '好きなテキストを指定してくだされ😇',
        );
        final textPainter = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, const Offset(30, 120));

        final picture = await recoder.endRecording();
        image = await picture.toImage(100, 200);

        final data = await image.toByteData(format: ui.ImageByteFormat.png);
        // バイトの配列に変換
        bytes = data.buffer.asUint8List();
      }
      var event = {
        'eventData': eventData,
        'eventImage': bytes,
      };
      print('return');
      print(image);
      return event;
    } catch (e) {
      print(e.toString());
    }
  }
//  void _onPressed() {}
}
