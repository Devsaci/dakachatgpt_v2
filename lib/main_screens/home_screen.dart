import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme_provider.dart';
import 'ai_chat_screen.dart';
import 'posts_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> tabs = [
    const AIChatScreen(),
    const PostsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<MyThemeProvider>(context);
    Color color = themeStatus.themeType ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChatGPT',
          style: TextStyle(
            color: color,
          ),
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
          )
        ],
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: color,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'A.I Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (kDebugMode) {
            print('Index $index');
          }
        },
      ),
    );
  }
}
