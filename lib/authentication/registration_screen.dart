import 'package:flutter/material.dart';

import '../service/image_cache_manager.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 35),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(AssetsManager.userIcon),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
