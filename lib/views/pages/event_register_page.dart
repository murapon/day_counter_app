import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EventRegisterPage extends StatefulWidget {
  const EventRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  _EventRegisterPageState createState() => _EventRegisterPageState();
}

enum RadioValue { FIRST, SECOND }

class _EventRegisterPageState extends State<EventRegisterPage> {
  // イベント日
  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(0),
        lastDate: DateTime(DateTime.now().year + 100, DateTime.now().month,
            DateTime.now().day));
    if (picked != null) setState(() => _date = picked);
  }

  // カウントタイプ
  int _countType = 1; // 経過時間
  static const String _countTypeProgressMessage = "イベントからの経過時間を表示します";
  static const String _countTypeLeftMessage = "イベントまでの残り時間を表示します";
  String _countTypeMessage = _countTypeProgressMessage;

  // 表示形式
  int _displayType = 1; // 日にち
  static const String _displayTypeDayMessage = "○日";
  static const String _displayTypeTimeMessage = "○日○時間○分";
  String _displayTypeMessage = _displayTypeDayMessage;

  // 写真
  File? _image;
  final imagePicker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future cancelImage() async {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント登録"),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        child: Column(
          children: <Widget>[
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
                        'タイトル：',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                        strutStyle: StrutStyle(
                          fontSize: 16.0,
                          height: 1.6,
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'イベント・記念日名'),
                        ),
                      ),
                    ],
                  )
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
                        '日付：',
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
                          outputFormat.format(_date),
                          style: TextStyle(fontSize: 18),
                          strutStyle: StrutStyle(
                            fontSize: 16.0,
                            height: 1,
                          ),
                        ),
                      ),
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
                        groupValue: _countType,
                        onChanged: (int? value) {
                          setState(() {
                            _countType = value!;
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
                        groupValue: _countType,
                        onChanged: (int? value) {
                          setState(() {
                            _countType = value!;
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
                        groupValue: _displayType,
                        onChanged: (int? value) {
                          setState(() {
                            _displayType = value!;
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
                        groupValue: _displayType,
                        onChanged: (int? value) {
                          setState(() {
                            _displayType = value!;
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
                        Container(
                          child: _image == null
                              ? Text('No image')
                              : Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                width: 80,
                                                child: Image.file(_image!)),
                                            IconButton(
                                              // アルバムアイコン
                                              icon: Icon(Icons.cancel),
                                              // サイズ
                                              iconSize: 33,
                                              onPressed: cancelImage,
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
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
                        label: const Text('登録'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {},
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
        ),
      ),
    );
  }
}
