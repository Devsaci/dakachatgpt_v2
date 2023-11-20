import 'package:flutter/material.dart';

class AIChatScreen extends StatelessWidget {
  const AIChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 180, 79, 129),
          shape: BoxShape.circle,
        ),
        child: const Center(child: Text("AIChatScreen")),
      ),
    );
  }
}
