import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper {
  static SharedPreferences? sharedPreferences;
  static Future<void> initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void presistAString({required String key, required String str}) async {
    initSharedPrefrences();
    sharedPreferences!.setString(key, str);
  }

  static String getAString({
    required String key,
  }) {
    initSharedPrefrences();
    return sharedPreferences!.getString(key) ?? "";
  }

  static void presistABool({required String key, required bool bool}) async {
    initSharedPrefrences();
    sharedPreferences!.setBool(key, bool);
  }

  static bool getABool({
    required String key,
  }) {
    initSharedPrefrences();
    return sharedPreferences!.getBool(key) ?? false;
  }

  static void removeSharedPrefrences() async {
    await sharedPreferences!.clear();
  }
}
