import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  bool _isTyping = false;
  bool get isTyping => _isTyping;

  set isTyping(bool value) => _isTyping = value;

  bool _isText = true;
  bool get isText => _isText;

  set isText(bool value) => _isText = value;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  sendMessage({
    required String uid,
    required String message,
    required String modelId,
    required Function onSuccess,
  }) {}
}
