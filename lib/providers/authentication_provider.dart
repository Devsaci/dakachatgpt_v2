import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool _isSuccessful = false;

  bool _isSignedIn = false;

  String? _uid;

  String? _phoneNumber;

  bool get isLoading => this._isLoading;
  set isLoading(bool value) => this._isLoading = value;

  bool get isSuccessful => this._isSuccessful;
  set isSuccessful(bool value) => this._isSuccessful = value;

  bool get isSignedIn => this._isSignedIn;
  set isSignedIn(bool value) => this._isSignedIn = value;

  String? get uid => this._uid;
  set uid(String? value) => this._uid = value;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  void signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required RoundedLoadingButtonController btnController,
  }) {}
}
