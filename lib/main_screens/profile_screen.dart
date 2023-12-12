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
        elevation: 0,
        title: Center(
          child: Text('Account', style: TextStyle(color: color)),
        ),
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
