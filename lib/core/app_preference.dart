import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  Future<SharedPreferences> _instance() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> getOnboarding() async {
    SharedPreferences prefs = await _instance();

    return prefs.getBool('onboarding') ?? false;
  }

  Future<bool> setOnboarding(bool value) async {
    SharedPreferences prefs = await _instance();

    return await prefs.setBool('onboarding', value);
  }

  Future setUserUID(String value) async {
    SharedPreferences prefs = await _instance();

    await prefs.setString('user_uid', value);
  }

  Future<String> getUserUID() async {
    SharedPreferences prefs = await _instance();

    return prefs.getString('user_uid');
  }

  Future setUserToken(String value) async {
    SharedPreferences prefs = await _instance();

    await prefs.setString('user_token', value);
  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await _instance();

    return prefs.getString('user_token');
  }

  Future setFcmToken(String value) async {
    SharedPreferences prefs = await _instance();

    await prefs.setString('fcm_token', value);
  }

  Future<String> getFcmToken() async {
    SharedPreferences prefs = await _instance();

    return prefs.getString('fcm_token');
  }

  Future clearPreference() async {
    SharedPreferences prefs = await _instance();

    await prefs.clear();
  }
}
