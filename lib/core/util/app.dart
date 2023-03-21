import 'package:cp_project/core/util/server.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  late SharedPreferences _prefs;
  final Server _server;

  App(this._server);

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setFCMToken(String fcmToken) async {
    final token = _prefs.getString('fcmToken');
    if (token != null && token.compareTo(fcmToken) == 0) {
      return true;
    }

    print('setting FCM $fcmToken');

    await _server.postFCMToken(fcmToken);
    return await _prefs.setString('fcmToken', fcmToken);
  } 
}