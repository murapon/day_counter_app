class DeviceInfoEntity {
  static final _items = <String, dynamic>{};
  static final DeviceInfoEntity _cache = DeviceInfoEntity._internal();

  factory DeviceInfoEntity() {
    return _cache;
  }
  DeviceInfoEntity._internal();

  setDevice(dynamic key, dynamic value) => _items[key] = value;

  getAppType() {
    return 'android';
  }
  getOsVersion() {
    if (_items.containsKey('os_version')) {
      return _items['os_version'];
    } else {
      return null;
    }
  }
  getAppVersion() {
    return '1.0.0';
  }
}
