import 'package:fluze/data/models/user.dart';
import 'package:fluze/helpers/assets/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {

  static final AppStorage _singleton = AppStorage._internal();

  factory AppStorage() {
    return _singleton;
  }

  AppStorage._internal();

  Future<void> saveUserData({ String? email, String? name }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppStrings.email, email!);
    await prefs.setString(AppStrings.name, name!);
  }

  Future<User> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(AppStrings.email);
    String? name = prefs.getString(AppStrings.name);
    return User(email: email, name: name);
  }



}