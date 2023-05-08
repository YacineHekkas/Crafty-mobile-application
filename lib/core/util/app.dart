import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/injection_container.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class App {
  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();

    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());
  }

  Future<bool> setFCMTokenTimestamp() async => await _prefs.setString('fcmTimestamp', DateTime.now().toString());

  String? getFCMTokenTimestamp() => _prefs.getString('fcmTimestamp');

  Future<bool> setShowIntro() async => await _prefs.setBool('showIntro', true);

  bool? getShowIntro() => _prefs.getBool('showIntro');

  Future<bool> setProvider({ bool value = true }) async => await _prefs.setBool('provider', value);

  bool? getProvider() => _prefs.getBool('provider');

  Future<bool> setUserToken(String token) async => await _prefs.setString('token', token);

  String? getUserToken() => _prefs.getString('token');

  Future<bool> setFCMToken(String fcmToken) async {
    final token = _prefs.getString('fcmToken');
    if (token != null && token.compareTo(fcmToken) == 0) {
      return true;
    }

    print('setting FCM $fcmToken');

    await locator<Server>().postFCMToken(fcmToken);
    return await _prefs.setString('fcmToken', fcmToken);
  } 
}