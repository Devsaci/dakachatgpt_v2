import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme_provider.dart';

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
    final isDarkTheme = Provider.of<MyThemeProvider>(context).themeType;
    Color color = isDarkTheme ? Colors.white : Colors.black;
    return const Placeholder();
  }
}
