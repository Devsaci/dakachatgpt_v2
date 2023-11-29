import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => this._isLoading;
  set isLoading(bool value) => this._isLoading = value;

  bool _isSuccessful = false;
  bool _isSignedIn = false;
  String? _uid;
}
