import 'package:dakachatgpt_v2/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    checkAuthentication();
    super.initState();
  }

  Future<void> checkAuthentication() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    if (await authProvider.checkSignedIn()) {
      // get user data from fireStore
      await authProvider.getUserDataFromFireStore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicator(
        color: Colors.orangeAccent,
      ),
    );
  }
}
