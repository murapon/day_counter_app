import 'package:openapi/api.dart';
import 'package:time_counter_app/entity/AccountEntity.dart';
import 'package:time_counter_app/entity/DeviceInfoEntity.dart';

class UserApiService {
  void getUser() async {
    var client = ApiClient(basePath: "http://10.0.2.2:31180");
// ヘッダを追加したい場合はクライアントに設定可能
//  client.addDefaultHeader("key", "value");

// ② APIクライアントラッパーを生成
// APIレスポンスをモデルに変換してくれる
    var api = UserApi(client);

// ③ レスポンスボディのみが欲しい場合は${パス名+HTTPメッソド名}のメソッドをcall
    DeviceInfoEntity deviceInfoEntity = new DeviceInfoEntity();

    ResponseUserPost user = await api.postUser(
        deviceInfoEntity.getAppType(), deviceInfoEntity.getOsVersion(), deviceInfoEntity.getOsVersion());
    // エンティティーに入れる
    AccountEntity accountEntity = new AccountEntity();
    accountEntity.setAccount('uuid', user.uuid);
    accountEntity.setAccount('password', user.password);
    accountEntity.setAccount('jwtKey', user.password);
  }
}
