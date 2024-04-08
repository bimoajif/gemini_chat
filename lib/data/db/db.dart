import 'package:shared_preferences/shared_preferences.dart';

class DB {
  SharedPreferences prefs;

  DB({
    required this.prefs,
  });

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> save({required String key, required var value}) async {
    await prefs.setString(key, value);
  }

  Future<Object?> fetch({required String key}) async {
    return prefs.get(key);
  }
}
