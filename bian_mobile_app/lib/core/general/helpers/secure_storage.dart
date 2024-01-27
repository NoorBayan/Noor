import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._();
  SecureStorage._();
  factory SecureStorage() {
    _instance._storage = const FlutterSecureStorage();
    return _instance;
  }
  late FlutterSecureStorage _storage;

  Future<bool> containsKey(String key) async {
    bool value = await _storage.containsKey(key: key);
    return value;
  }

  Future<String?> getData(String key) async {
    String? data = await _storage.read(key: key);
    return data;
  }

  Future setData({required String key, required String data}) async {
    await _storage.write(key: key, value: data);
  }

  Future deleteData(String key) async {
    await _storage.delete(key: key);
  }

  Future deleteAllData() async {
    await _storage.deleteAll();
  }
}
