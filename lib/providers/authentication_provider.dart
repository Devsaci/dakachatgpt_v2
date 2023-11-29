import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool _isSuccessful = false;

  bool _isSignedIn = false;

  String? _uid;

  bool get isLoading => this._isLoading;
  set isLoading(bool value) => this._isLoading = value;

  bool get isSuccessful => this._isSuccessful;
  set isSuccessful(bool value) => this._isSuccessful = value;

  bool get isSignedIn => this._isSignedIn;
  set isSignedIn(bool value) => this._isSignedIn = value;

  String? get uid => this._uid;
  set uid(String? value) => this._uid = value;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
}
