import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/my_theme_provider.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({super.key});

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<MyThemeProvider>(context).themeType;
    Color color = isDarkTheme ? Colors.white : Colors.black;

    return Material(
      color: isDarkTheme ? Constants.chatGPTDarkCardColor : Colors.white70,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              style: TextStyle(color: color),
              decoration: InputDecoration.collapsed(
                hintText: 'How can i help you?',
                hintStyle: TextStyle(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
