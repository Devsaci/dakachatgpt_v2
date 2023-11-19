import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class MyThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;

  bool get themeType => _darkTheme;

  set setTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }

  void saveThemeToSharedPreferences({required bool value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.themeStatus, value);
  }
}
