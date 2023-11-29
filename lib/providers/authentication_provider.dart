import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isSuccessful = false;
  bool _isSignedIn = false;
}
