import 'package:dakachatgpt_v2/providers/chat_provider.dart';
import 'package:dakachatgpt_v2/widgets/bottom_chat_field.dart';
import 'package:dakachatgpt_v2/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme_provider.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<MyThemeProvider>(context).themeType;
    Color color = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("ChatGPT", style: TextStyle(color: color)),
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          //
          if (context.watch<ChatProvider>().isTyping) ...[
            SpinKitDoubleBounce()
          ],

          const SizedBox(height: 15.0),
          const BottomChatField(),
        ],
      ),
    );
  }
}
