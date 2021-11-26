import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_counter_app/entity/AccountEntity.dart';

class SpAccount {
  /**
   * アカウント情報を取得
   */
  void getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uuid = prefs.getString('uuid') ?? null;
    String password = prefs.getString('password') ?? null;
    String jwtKey = prefs.getString('jwtKey') ?? null;
    // エンティティーに入れる
    AccountEntity accountEntity = new AccountEntity();
    accountEntity.setAccount('uuid', uuid);
    accountEntity.setAccount('password', password);
    accountEntity.setAccount('jwtKey', jwtKey);
  }

  /**
   * アカウント情報を保存
   */
  void setAccount(String uuid, String password, String jwtKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uuid', uuid);
    await prefs.setString('password', password);
    await prefs.setString('jwtKey', jwtKey);
  }

  /**
   * jwt keyを保存
   */
  void setJwtKey(String jwtKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtKey', jwtKey);
  }
}
