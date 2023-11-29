import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => this._isLoading;
  set isLoading(bool value) => this._isLoading = value;

  bool _isSuccessful = false;
  bool get isSuccessful => this._isSuccessful;

  set isSuccessful(bool value) => this._isSuccessful = value;

  bool _isSignedIn = false;
  bool get isSignedIn => this._isSignedIn;

  set isSignedIn(bool value) => this._isSignedIn = value;

  String? _uid;
  String? get uid => this._uid;

  set uid(String? value) => this._uid = value;
}
