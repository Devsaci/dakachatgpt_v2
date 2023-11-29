// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../utility/utility.dart';

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

  String? get phoneNumber => this._phoneNumber;
  set phoneNumber(String? value) => this._phoneNumber = value;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// sign in user with phone
  Future<void> signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required RoundedLoadingButtonController btnController,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+44 7123 123 456',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseException catch (e) {
      // show error message to user
      btnController.reset();
      showSnackBar(context: context, content: e.toString());
    }
  }
}
