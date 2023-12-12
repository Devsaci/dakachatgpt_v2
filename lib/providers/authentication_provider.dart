// ignore_for_file: unnecessary_this

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dakachatgpt_v2/authentication/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

import '../model/user_model.dart';
import '../utility/utility.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isSuccessful = false;
  //bool _isSignedIn = false;
  String? _uid;
  String? _phoneNumber;

  UserModel? _userModel;

  String? get uid => this._uid;
  String get phoneNumber => this._phoneNumber!;
  bool get isSuccessful => this._isSuccessful;
  bool get isLoading => this._isLoading;
  UserModel? get userModel => this._userModel;

  set isLoading(bool value) => this._isLoading = value;
  set isSuccessful(bool value) => this._isSuccessful = value;
  // bool get isSignedIn => this._isSignedIn;
  // set isSignedIn(bool value) => this._isSignedIn = value;
  set uid(String? value) => this._uid = value;
  set phoneNumber(String? value) => this._phoneNumber = value;
  set userModel(value) => this._userModel = value;

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
  Future<void> saveUserDataToFireStore({
    required BuildContext context,
    required UserModel userModel,
    required File fileImage,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      // upload image to storage
      String imageUrl = await storeFileImageToStorage(
          '${Constants.userImages}/$uid.jpg', fileImage);
      userModel.profilePic = imageUrl;
      userModel.lastSeen = DateTime.now().microsecondsSinceEpoch.toString();
      userModel.dateJoined = DateTime.now().microsecondsSinceEpoch.toString();

      _userModel = userModel;

      // save data to fireStore
      await firebaseFirestore
          .collection(Constants.users)
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseException catch (e) {
      _isLoading = false;
      notifyListeners();
      showSnackBar(context: context, content: e.toString());
    }
  }

  // store image to firestore and get download URL
  Future<String> storeFileImageToStorage(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // check if user exits
  Future<bool> checkUserExist() async {
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection(Constants.users).doc(_uid).get();
    if (documentSnapshot.exists) {
      return true;
    } else {
      return false;
    }
  }

// get user data from fireStore
  Future getUserDataFromFireStore() async {
    await firebaseFirestore
        .collection(Constants.users)
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((documentSnapshot) {
      _userModel = UserModel(
        uid: documentSnapshot[Constants.uid],
        name: documentSnapshot[Constants.name],
        profilePic: documentSnapshot[Constants.profilePic],
        phone: documentSnapshot[Constants.phone],
        aboutMe: documentSnapshot[Constants.aboutMe],
        lastSeen: documentSnapshot[Constants.lastSeen],
        dateJoined: documentSnapshot[Constants.dateJoined],
        isOnline: documentSnapshot[Constants.isOnline],
      );
      _uid = _userModel!.uid;
      notifyListeners();
    });
  }

  // store user data to shared preference saveUserDataToSharedPref
  Future saveUserDataToSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        Constants.userModel, jsonEncode(userModel!.toMap()));
  }

  // store user data to shared preference getUserDataFromSharedPref
  Future getUserDataFromSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(Constants.userModel) ?? '';
  }

// signOutUser method
  Future<void> signOutUser() async {
    await firebaseAuth.signOut();
  }
}
