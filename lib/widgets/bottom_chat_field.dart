import 'package:dakachatgpt_v2/providers/authentication_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/chat_provider.dart';
import '../providers/my_theme_provider.dart';
import '../utility/utility.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({super.key});

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  late TextEditingController textEditingController;
  String chatGPTModel = 'gpt-3.5-turbo';
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(color: color),
                decoration: InputDecoration.collapsed(
                  hintText: 'How can i help you?',
                  hintStyle: TextStyle(color: color),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // first lets check if user has entered something
              if (textEditingController.text.isEmpty) {
                showSnackBar(
                    context: context, content: 'Please type a message');
                return;
              }
              context.read<ChatProvider>().sendMessage(
                    uid: context.read<AuthenticationProvider>().userModel!.uid,
                    message: textEditingController.text,
                    modelId: chatGPTModel,
                    onSuccess: () {
                      textEditingController.text = '';
                      if (kDebugMode) {
                        print("Succses");
                      }
                    },
                    onCompleted: () {
                      if (kDebugMode) {
                        print("Completed");
                      }
                    },
                  );
            },
            icon: Icon(Icons.send, color: color),
          ),
        ],
      ),
    );
  }
}
