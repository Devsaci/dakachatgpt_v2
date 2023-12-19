import 'package:dakachatgpt_v2/widgets/chat_list.dart';
import 'package:flutter/material.dart';
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
    final themeStatus = Provider.of<MyThemeProvider>(context);
    Color color = themeStatus.themeType ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("ChatGPT", style: TextStyle(color: color)),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatList(),
          ),
        ],
      ),
    );
  }
}
