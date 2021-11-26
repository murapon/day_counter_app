import 'package:openapi/api.dart';
import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/entity/DeviceInfoEntity.dart';
import 'package:time_counter_app/storage/SpAccount.dart';

class UserApiService {
  /**
   * 新規アカウント発行
   */
  void getUser() async {
    print("UserApiService : getUser");
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
// ヘッダを追加したい場合はクライアントに設定可能
//  client.addDefaultHeader("key", "value");

// ② APIクライアントラッパーを生成
// APIレスポンスをモデルに変換してくれる
    var api = UserApi(client);

// ③ レスポンスボディのみが欲しい場合は${パス名+HTTPメッソド名}のメソッドをcall
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();
    ResponseUserPost user = await api.postUser(
        deviceInfoEntity.getAppType(), deviceInfoEntity.getAppVersion(), deviceInfoEntity.getOsVersion());
    // shared preferenceに登録する
    var spDevice = new SpAccount();
    await spDevice.setAccount(user.uuid, user.password, user.jwtKey);

    // エンティティーに入れる
    AccountEntity accountEntity = new AccountEntity();
    accountEntity.setAccount('uuid', user.uuid);
    accountEntity.setAccount('password', user.password);
    accountEntity.setAccount('jwt', user.jwtKey);
  }
}
