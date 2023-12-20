import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  bool _isTyping = false;
  bool get isTyping => this._isTyping;

  set isTyping(bool value) => this._isTyping = value;
  bool _isText = true;
}
