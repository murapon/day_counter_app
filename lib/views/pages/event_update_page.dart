import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:time_counter_app/services/api/EventsApiService.dart';
import 'package:time_counter_app/services/validator/EventValidator.dart';
import 'package:time_counter_app/utility/ResponseConvert.dart';

class EventUpdatePage extends StatefulWidget {
  final arguments;

  EventUpdatePage({this.arguments});

  @override
  _EventUpdatePageState createState() => _EventUpdatePageState();
}

enum RadioValue { FIRST, SECOND }

class _EventUpdatePageState extends State<EventUpdatePage> {
  Map _request;
  bool _initial_display = true;

  // イベント日
//  DateTime _date;
//  String _time;
  bool _isEnabledTimeDelete;

  // カウントタイプ
  int _requestCountType; // 経過時間
  static const String _countTypeProgressMessage = "イベントからの経過時間を表示します";
  static const String _countTypeLeftMessage = "イベントまでの残り時間を表示します";
  String _countTypeMessage = _countTypeProgressMessage;

  // 表示形式
  int _requestDisplayType; // 日にち
  static const String _displayTypeDayMessage = "○日";
  static const String _displayTypeTimeMessage = "○日○時間○分";
  String _displayTypeMessage = _displayTypeDayMessage;

  // 写真
  File _image = null;
  final imagePicker = ImagePicker();
  String _currentImageName = null;

  // 更新用リクエストデータ
  String _requestTitle;
  String _requestEventDate;
  String _requestEventTime;
  bool _requestIsDeleteImage = false;

  void initState() {
    super.initState();
    _request = Map<String, dynamic>.from(widget.arguments);
    print(_request);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(_requestEventDate),
        firstDate: new DateTime(0),
        lastDate: DateTime(DateTime.now().year + 100, DateTime.now().month, DateTime.now().day));
    if (_picked != null) {
      print(_picked);
      var formatter = new DateFormat('yyyy-MM-dd');
      setState(() => _requestEventDate = formatter.format(_picked));
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay _selectTime = TimeOfDay.now();
    final TimeOfDay _picked = await showTimePicker(
      context: context,
      initialTime: _selectTime,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (_picked != null) {
      setState(() {
        _requestEventTime = _picked.hour.toString().padLeft(2, "0") + ":" + _picked.minute.toString().padLeft(2, "0");
        _isEnabledTimeDelete = true;
      });
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future cancelImage() async {
    setState(() {
      _image = null;
      _requestIsDeleteImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('EventUpdatePage start');
    print(_request['event_id']);
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return Scaffold(
        appBar: AppBar(
          title: Text("イベント更新"),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          child: FutureBuilder(
            future: _getEvent(_request['event_id'].toString()),
            builder: (BuildContext context, AsyncSnapshot<ResponseEventDetailGet> snapshot) {
              if (snapshot.hasData == false) {
                return Text("データが存在しません");
              }
              if (_initial_display) {
                _requestTitle = snapshot.data.title;
                _requestEventDate = snapshot.data.eventDate;
                if (snapshot.data.eventTime != null) {
                  _requestEventTime = snapshot.data.eventTime;
                  _isEnabledTimeDelete = true;
                } else {
                  _requestEventTime = '00:00';
                  _isEnabledTimeDelete = false;
                }
                _requestCountType = ResponseConvert.getCountType(snapshot.data.countType);
                _requestDisplayType = ResponseConvert.getDisplayType(snapshot.data.displayType);
                _currentImageName = snapshot.data.imageName;
                _initial_display = false;
              }

              print(snapshot.data);
              print(snapshot.data.id);
              return Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'タイトル：',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                          strutStyle: StrutStyle(
                            fontSize: 16.0,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          initialValue: snapshot.data.title,
                          onChanged: (value) {
                            _requestTitle = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '日時：',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                            new TextButton(
                              onPressed: () => _selectDate(context),
                              child: new Text(
                                _requestEventDate,
                                style: TextStyle(fontSize: 18),
                                strutStyle: StrutStyle(
                                  fontSize: 16.0,
                                  height: 1,
                                ),
                              ),
                            ),
                            new TextButton(
                              onPressed: () => _selectTime(context),
                              child: new Text(
                                _requestEventTime,
                                style: TextStyle(fontSize: 18),
                                strutStyle: StrutStyle(
                                  fontSize: 16.0,
                                  height: 1,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: !_isEnabledTimeDelete
                                  ? null
                                  : () {
                                      setState(() {
                                        _requestEventTime = '00:00';
                                        _isEnabledTimeDelete = false;
                                      });
                                    },
                              // 表示アイコン
                              icon: Icon(Icons.delete),
                              // アイコン色
                              color: Colors.pink,
                              // サイズ
                              iconSize: 24,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'カウント：',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                            Radio(
                              activeColor: Colors.blueAccent,
                              value: 1,
                              groupValue: _requestCountType,
                              onChanged: (int value) {
                                setState(() {
                                  _requestCountType = value;
                                  _countTypeMessage = _countTypeProgressMessage;
                                });
                              },
                            ),
                            Text(
                              '経過',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                            Radio(
                              activeColor: Colors.blueAccent,
                              value: 2,
                              groupValue: _requestCountType,
                              onChanged: (int value) {
                                setState(() {
                                  _requestCountType = value;
                                  _countTypeMessage = _countTypeLeftMessage;
                                });
                              },
                            ),
                            Text(
                              '残り',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      _countTypeMessage,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '表示形式：',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                            Radio(
                              activeColor: Colors.blueAccent,
                              value: 1,
                              groupValue: _requestDisplayType,
                              onChanged: (int value) {
                                setState(() {
                                  _requestDisplayType = value;
                                  _displayTypeMessage = _displayTypeDayMessage;
                                });
                              },
                            ),
                            Text(
                              '日数',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                            Radio(
                              activeColor: Colors.blueAccent,
                              value: 2,
                              groupValue: _requestDisplayType,
                              onChanged: (int value) {
                                setState(() {
                                  _requestDisplayType = value;
                                  _displayTypeMessage = _displayTypeTimeMessage;
                                });
                              },
                            ),
                            Text(
                              '時間数',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                              strutStyle: StrutStyle(
                                fontSize: 16.0,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      _displayTypeMessage,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '写真：  ',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16),
                                strutStyle: StrutStyle(
                                  fontSize: 16.0,
                                  height: 1.6,
                                ),
                              ),
                              IconButton(
                                // アルバムアイコン
                                icon: Icon(Icons.photo_album),
                                // アイコン色
//                        color: Colors.pink,
                                // サイズ
                                iconSize: 33,
                                onPressed: getImageFromGallery,
                              ),
                              IconButton(
                                // アルバムアイコン
                                icon: Icon(Icons.photo_camera),
                                // アイコン色
//                        color: Colors.pink,
                                // サイズ
                                iconSize: 33,
                                onPressed: getImageFromCamera,
                              ),
                              Container(child: _getImageContainer()
/*
                                child: _image == null
                                    ? Text('No image')
                                    : Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(width: 80, child: Image.file(_image)),
                                                  IconButton(
                                                    // 削除アイコン
                                                    icon: Icon(Icons.cancel),
                                                    // サイズ
                                                    iconSize: 33,
                                                    onPressed: cancelImage,
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
*/

                                  ),
                            ]),
                      ],
                    ),
                  ),
                  Container(
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
                                Icons.edit,
                                color: Colors.white,
                              ),
                              label: const Text('更新する'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () async {
                                print("更新ボタンクリック");
                                print(_requestDisplayType);
                                // 入力チェック
                                List error = EventValidator.check(
                                    _requestTitle, _requestEventDate, _requestEventTime, _requestCountType);
                                if (error.length > 0) {
                                  String errorMessage = '';
                                  for (var i = 0; i < error.length; i++) {
                                    errorMessage += error[i] + '\n';
                                  }
                                  showDialog<int>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
//                                      title: Text('確認'),
                                        content: Text(errorMessage),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK'),
                                            onPressed: () => Navigator.of(context).pop(1),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  // データ更新
                                  _updateEvent(
                                    _request['event_id'].toString(),
                                  ).then((resultApi) {
                                    String _dialogContents;
                                    showDialog<int>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
//                                      title: Text('確認'),
                                          content: Text(resultApi['message']),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('OK'),
                                              onPressed: () => Navigator.of(context).pop(1),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                }
                              },
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              label: const Text('閉じる'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/event_list');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }

  // ignore: missing_return
  Future<ResponseEventDetailGet> _getEvent(eventId) async {
    try {
      var eventsApiService = new EventsApiService();
      // イベント一覧取得
      print("_getEvent");
      var eventData = await eventsApiService.getEvent(eventId);
      return eventData;
    } catch (e) {
      print(e.toString());
    }
  }

  _getImageContainer() {
//    print('http://localhost:31180/img/' + _currentImageName);
    if (_image != null) {
      return Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                  Container(width: 80, child: Image.file(_image)),
                  IconButton(
                    // 削除アイコン
                    icon: Icon(Icons.cancel),
                    // サイズ
                    iconSize: 33,
                    onPressed: cancelImage,
                  )
                ])
              ]));
    } else if (_currentImageName != null && _requestIsDeleteImage == false) {
      return Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                  Container(width: 80, child: Image.network('http://10.0.2.2:31180/img/' + _currentImageName)),
                  IconButton(
                    // 削除アイコン
                    icon: Icon(Icons.cancel),
                    // サイズ
                    iconSize: 33,
                    onPressed: cancelImage,
                  )
                ])
              ]));
    } else {
      return Text('No image');
    }
  }

  // イベント更新
  // ignore: missing_return
  Future<Map> _updateEvent(eventId) async {
    try {
      String img64 = null;
      if (_image != null) {
        final bytes = _image.readAsBytesSync();
        img64 = base64Encode(bytes);
      }
      var eventsApiService = new EventsApiService();
      return await eventsApiService.updateEvent(eventId, _requestTitle, _requestEventDate, _requestEventTime,
          _requestCountType, _requestDisplayType, img64, _requestIsDeleteImage);
    } catch (e) {
      print(e.toString());
    }
  }
}
