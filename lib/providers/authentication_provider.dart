// ignore_for_file: unnecessary_this

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dakachatgpt_v2/authentication/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../model/user_model.dart';
import '../utility/utility.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isSuccessful = false;
  //bool _isSignedIn = false;
  String? _uid;
  String? _phoneNumber;

  String? get uid => this._uid;
  String get phoneNumber => this._phoneNumber!;
  bool get isSuccessful => this._isSuccessful;
  bool get isLoading => this._isLoading;

  set isLoading(bool value) => this._isLoading = value;
  set isSuccessful(bool value) => this._isSuccessful = value;
  // bool get isSignedIn => this._isSignedIn;
  // set isSignedIn(bool value) => this._isSignedIn = value;
  set uid(String? value) => this._uid = value;
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
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await firebaseAuth.signInWithCredential(credential);
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          _phoneNumber = phoneNumber;
          notifyListeners();
          btnController.success();
          Future.delayed(const Duration(seconds: 1)).whenComplete(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(
                  verificationId: verificationId,
                ),
              ),
            );
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseException catch (e) {
      // show error message to user
      btnController.reset();
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<void> verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String smsCode,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      User? user =
          (await firebaseAuth.signInWithCredential(phoneAuthCredential)).user;
      if (user != null) {
        _uid = user.uid;
        notifyListeners();
        onSuccess();
      }

      _isLoading = false;
      _isSuccessful = true;
      notifyListeners();
    } on FirebaseException catch (e) {
      _isLoading = false;
      notifyListeners();
      showSnackBar(context: context, content: e.toString());
    }
  }

  // save user data to fireStore database
  void saveUserDataToFireStore({
    required BuildContext context,
    required UserModel userModel,
    required File fileImage,
    required Function onSuccess,
  }) {
    _isLoading = true;
    notifyListeners();
    try {} on FirebaseException catch (e) {}
  }

  // store image to firestore and get download URL
  Future<String> storeFileImageToStorage(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
