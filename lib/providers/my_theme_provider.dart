import 'package:flutter/cupertino.dart';

class MyThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;

  bool get themeType => _darkTheme;

  set setTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
