import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 141, 63, 25),
          shape: BoxShape.circle,
        ),
        child: const Center(child: Text("PostsScreen")),
      ),
    );
  }
}
