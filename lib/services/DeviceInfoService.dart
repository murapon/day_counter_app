import 'dart:async';

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:time_counter_app/entity/DeviceInfoEntity.dart';

class DeviceInfoService {
  Future<List<String>> setDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    var deviceData = <String, dynamic>{};
    if (Platform.isAndroid) {
      deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
    DeviceInfoEntity().setDevice('os_version', deviceData['osVersion'].toString());
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'osVersion': build.version.sdkInt,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'osVersion': data.systemVersion,
    };
  }
}
