// import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // static late final SharedPreferences _prefs;
  static const userSaveKey = '__user_save_key__';
  Future<StorageService> init() async {
    // _prefs = await SharedPreferences.getInstance();
    return this;
  }

  static Future<bool> setString(String value) async {
    //   return await _prefs.setString(userSaveKey, value);
    return true;
  }

  static String get savedList {
    //   return _prefs.getString(key) ?? '';
    return '';
  }
}
