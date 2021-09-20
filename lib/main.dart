import 'package:flutter/material.dart';
import 'package:time_counter_app/views/pages/event_detail_page.dart';
import 'package:time_counter_app/views/pages/event_register_page.dart';

//import 'index_page.dart';
//import '/app/src/views/pages/grid_view_page.dart';
//import '/android/app/views/pages/grid_view_page.dart'
//import '/views/pages/grid_view_page.dart';
import '/views/pages/event_list_page.dart';
//import '/views/pages/event_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
//      home: IndexPage(),
//      home: EventListPage()
      routes: {
        '/': (context) => EventListPage(),
        '/event_list': (context) => EventListPage(),
        '/event_detail': (context) => EventDetailPage(),
        '/event_register': (context) => EventRegisterPage(),
//        '/event_update': (context) => EventUpdatePage(),
//        '/setting': (context) => SettingPage(),
      },
    );
  }
}
