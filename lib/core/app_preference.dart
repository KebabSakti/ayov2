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

  Future<String> getUserUID(String value) async {
    SharedPreferences prefs = await _instance();

    return prefs.getString('user_uid');
  }

  Future setUserToken(String value) async {
    SharedPreferences prefs = await _instance();

    await prefs.setString('user_token', value);
  }

  Future<String> getUserToken(String value) async {
    SharedPreferences prefs = await _instance();

    return prefs.getString('user_token');
  }
}
