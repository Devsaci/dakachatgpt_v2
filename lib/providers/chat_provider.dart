import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../constants/constants.dart';

class ChatProvider extends ChangeNotifier {
  bool _isTyping = false;
  // ignore: unnecessary_getters_setters
  bool get isTyping => _isTyping;

  set isTyping(bool value) => _isTyping = value;

  bool _isText = true;
  // ignore: unnecessary_getters_setters
  bool get isText => _isText;

  set isText(bool value) => _isText = value;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String uid,
    required String message,
    required String modelId,
    required Function onSuccess,
    required Function onCompleted,
  }) async {
    try {
      _isTyping = true;
      notifyListeners();
      // send user message to fireStore
      sendMessageToFireStore(uid: uid, message: message);
      // send the same message to chatGPT and get answer
      _isTyping = false;
      onSuccess();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } finally {
      _isTyping = false;
      notifyListeners();
      onCompleted();
    }
  }

  Future<void> sendMessageToFireStore({
    required String uid,
    required String message,
  }) async {
    String chatId = const Uuid().v4();
    await firebaseFirestore
        .collection(Constants.chats)
        .doc(uid)
        .collection(Constants.chatGPTChats)
        .doc(chatId)
        .set({
      Constants.senderId: uid,
      Constants.chatId: chatId,
      Constants.message: message,
      Constants.messageTime: FieldValue.serverTimestamp(),
      Constants.isText: isText,
    });
  }
}
