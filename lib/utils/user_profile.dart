import 'package:shared_preferences/shared_preferences.dart';

class UserProfile {
  static const _cityKey = 'user_city';
  static const _countryKey = 'user_country';

  static Future<void> saveProfile(String city, String country) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cityKey, city);
    await prefs.setString(_countryKey, country);
  }

  static Future<Map<String, String?>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString(_cityKey);
    final country = prefs.getString(_countryKey);

    return {'city': city, 'country': country};
  }
}
