import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 40, 25, 141),
          shape: BoxShape.circle,
        ),
        child: const Center(child: Text("ProfileScreen")),
      ),
    );
  }
}
