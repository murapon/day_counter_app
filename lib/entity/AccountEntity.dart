class AccountEntity {
  static final _items = <String, dynamic>{};
  static final AccountEntity _cache = AccountEntity._internal();

  factory AccountEntity() {
    return _cache;
  }

  AccountEntity._internal();

  setAccount(dynamic key, dynamic value) => _items[key] = value;

  getUuid() {
    if (_items.containsKey('uuid')) {
      return _items['uuid'];
    } else {
      return null;
    }
  }

  getPassword() {
    if (_items.containsKey('password')) {
      return _items['password'];
    } else {
      return null;
    }
  }

  getJwtKey() {
    if (_items.containsKey('jwtKey')) {
      return _items['jwtKey'];
    } else {
      return null;
    }
  }
}
