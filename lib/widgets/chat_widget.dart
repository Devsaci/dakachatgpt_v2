import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  // const ChatWidget({super.key});
  const ChatWidget({
    Key? key,
    required this.messageData,
    required this.senderId,
  }) : super(key: key);

  final dynamic messageData;
  final dynamic senderId;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
