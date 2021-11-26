import 'package:flutter/material.dart';
import 'package:time_counter_app/services/api/UserApiService.dart';
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
    print("initState");
    //アプリ起動時に一度だけ実行される
    // OS情報取得、アプリID取得
    Future(() async {
      await _initApp();
//      Navigator.pushNamed(context, '/event_list');

//      print("initState end");
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return MaterialApp(routes: {'/': (context) => EventListPage()}
//          //       );
//          );
//      Future(() {
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//          return EventListPage();
//        }));
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
      routes: {
        '/': (context) => EventRegisterPage(),
        '/event_list': (context) => EventListPage(),
        '/event_detail': (context) => EventDetailPage(),
        '/event_register': (context) => EventRegisterPage(),
//        '/event_update': (context) => EventUpdatePage(),
//        '/setting': (context) => SettingPage(),
      },
    );
  }

  _initApp() async {
//    print("_initApp start");
    // OS情報取得
    var deviceInfoService = new DeviceInfoService();
    await deviceInfoService.setDeviceInfo();
    // 初期設定：アプリID取得
/*
    var spDevice = new SpAccount();
    await spDevice.getAccount();
    AccountEntity accountEntity = new AccountEntity();
    print("No.1 start uuid");
    print(accountEntity.getUuid());
    //   if (accountEntity.getUuid() == null) {
    var userApiService = new UserApiService();
    await userApiService.getUser();
//    }
*/
//    print("_initApp end");
  }
}
