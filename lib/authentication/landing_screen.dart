import 'package:dakachatgpt_v2/authentication/registration_screen.dart';
import 'package:dakachatgpt_v2/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screens/home_screen.dart';

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
      // get data from shared preferences
      await authProvider.getUserDataFromSharedPref();
      // navigate to home
      navigate(isSingedIn: true);
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

  void navigate({required bool isSingedIn}) {
    if (isSingedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationScreen()),
          (route) => false);
    }
  }
}
