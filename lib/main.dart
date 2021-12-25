import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:time_counter_app/services/api/UserApiService.dart';
import 'package:time_counter_app/views/pages/event_update_page.dart';
import 'package:time_counter_app/views/pages/sample_page.dart';
import 'entity/AccountEntity.dart';
import 'services/DeviceInfoService.dart';
import 'views/pages/event_detail_page.dart';
import 'views/pages/event_register_page.dart';

//import 'index_page.dart';
//import '/app/src/views/pages/grid_view_page.dart';
//import '/android/app/views/pages/grid_view_page.dart'
//import '/views/pages/grid_view_page.dart';
import './views/pages/event_list_page.dart';
import 'entity/DeviceInfoEntity.dart';
import 'storage/SpAccount.dart';
//import '/views/pages/event_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //アプリ起動時に一度だけ実行される
    // OS情報取得、アプリID取得
    Future(() async {
      await _initApp();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],
        ),
/*
        routes: {
//        '/': (context) => SamplePage(),
          '/': (context) => EventRegisterPage(),
          '/event_list': (context) => EventListPage(),
//          '/event_detail': (context) => EventDetailPage(),
          '/event_register': (context) => EventRegisterPage(),
//        '/event_update': (context) => EventUpdatePage(),
//        '/setting': (context) => SettingPage(),
        },
*/
        initialRoute: '/',
        onGenerateRoute: (settings) {
          var routes = <String, WidgetBuilder>{
            '/': (context) => EventListPage(),
            '/event_list': (context) => EventListPage(),
            '/event_detail': (context) => EventDetailPage(arguments: settings.arguments),
            '/event_register': (context) => EventRegisterPage(),
            '/event_update': (context) => EventUpdatePage(arguments: settings.arguments),
          };
          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        });
  }

  _initApp() async {
    // OS情報取得
    var deviceInfoService = new DeviceInfoService();
    await deviceInfoService.setDeviceInfo();
    // 画像を入れるディレクトリ作成
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Directory appDirectory = Directory(appDocPath + '/img/');
    await appDirectory.create(recursive: true);
  }
}
