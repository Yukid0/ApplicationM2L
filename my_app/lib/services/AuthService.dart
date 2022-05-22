import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static int currentUserId = -1;
  static void disconnect() async {
    currentUserId = -1;
    savePreferences("", "");
  }

  static void savePreferences(String? login, String? password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', login!);
    prefs.setString('password', password!);
  }
}
