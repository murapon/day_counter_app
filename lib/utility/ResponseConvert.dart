import 'package:openapi/api.dart';

class ResponseConvert {
  /**
   * カウントタイプを数値に変換
   */
  static int getCountType(ResponseEventDetailGetCountTypeEnum _countType) {
    if(_countType == ResponseEventDetailGetCountTypeEnum.progress) {
      // 経過
      return 1;
    } else {
      // 残り
      return 2;
    }
  }
  /**
   * 表示タイプを数値に変換
   */
  static int getDisplayType(ResponseEventDetailGetDisplayTypeEnum _displayType) {
    if(_displayType == ResponseEventDetailGetDisplayTypeEnum.day) {
      // 経過
      return 1;
    } else {
      // 残り
      return 2;
    }
  }
}
