import 'package:cp_project/core/util/server.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class App {
  late SharedPreferences _prefs;
  final Server _server;

  App(this._server);

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();

    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());
  }

  Future<bool> setFCMTokenTimestamp() async => await _prefs.setString('fcmTimestamp', DateTime.now().toString());

  String? getFCMTokenTimestamp() => _prefs.getString('fcmTimestamp');

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