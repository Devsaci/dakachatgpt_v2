import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<MyThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ChatGPT',
            style: TextStyle(
              color: themeStatus.themeType ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print("ThemeMode Action");
                }
              },
              icon: Icon(
                themeStatus.themeType
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: themeStatus.themeType ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
        body: const Center(child: Text("ChatGpt")));
  }
}
