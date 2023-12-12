import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<MyThemeProvider>(context);
    Color color = themeStatus.themeType ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: color),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (themeStatus.themeType) {
                themeStatus.setTheme = false;
                if (kDebugMode) {
                  print("ThemeMode Light");
                }
              } else {
                themeStatus.setTheme = true;
                if (kDebugMode) {
                  print("ThemeMode Dark");
                }
              }
            },
            icon: Icon(
              themeStatus.themeType
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(themeStatus.themeType
                ? Icons.logout_outlined
                : Icons.logout_outlined),
            color: color,
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 160, 22, 178),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text("ProfileScreen"),
          ),
        ),
      ),
    );
  }
}
