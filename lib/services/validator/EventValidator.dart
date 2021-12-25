//import 'dart:async';

//import 'dart:io';
//import 'package:device_info_plus/device_info_plus.dart';
//import 'package:time_counter_app/entity/DeviceInfoEntity.dart';

import 'package:intl/intl.dart';

class EventValidator {
  static List check(String title, String eventDate, String eventTime, int countType) {
    List errorMessage = <String>[];
    final _dateFormatter = DateFormat("y-M-d HH:mm");
    DateTime now = DateTime.now();
    if (title == '') {
      errorMessage.add('イベント名を入力してください');
    }
    if (eventDate == '') {
      errorMessage.add('イベント日を入力してください');
    }



    if (countType == 1) {
      // 経過
      try {
        DateTime eventDatetime = _dateFormatter.parseStrict(eventDate + ' ' + eventTime);
        if (eventDatetime.isAfter(now)) {
          errorMessage.add('過去の日時を入力してください');
        }
      } catch (e) {
        errorMessage.add('日時が不正です');
      }
    } else {
      // 残り
      try {
        DateTime eventDatetime = _dateFormatter.parseStrict(eventDate + ' ' + eventTime);
print(now);
print(eventDatetime);

        if (now.isAfter(eventDatetime)) {
          errorMessage.add('未来の日時を入力してください');
        }
      } catch (e) {
        errorMessage.add('日時が不正です');
      }
    }
    return errorMessage;
  }
}
