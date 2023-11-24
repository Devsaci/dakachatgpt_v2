import 'package:dakachatgpt_v2/service/image_cache_manager.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage(AssetsManager.openAILogo),
              ),
            ),
          ],
        )),
      )),
    );
  }
}
