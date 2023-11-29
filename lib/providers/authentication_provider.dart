import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => this._isLoading;
  set isLoading(bool value) => this._isLoading = value;

  bool _isSuccessful = false;
  bool get isSuccessful => this._isSuccessful;

  set isSuccessful(bool value) => this._isSuccessful = value;

  bool _isSignedIn = false;
  String? _uid;
}
