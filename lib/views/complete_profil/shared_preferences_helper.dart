import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // الحصول على حالة الاكتمال (التظليل)
  static Future<bool?> getCompletionState(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // حفظ حالة الاكتمال (التظليل)
  static Future<void> saveCompletionState(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
