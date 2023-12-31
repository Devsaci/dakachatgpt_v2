import 'package:dakachatgpt_v2/authentication/landing_screen.dart';
import 'package:dakachatgpt_v2/providers/chat_provider.dart';
import 'package:dakachatgpt_v2/providers/my_theme_provider.dart';
import 'package:dakachatgpt_v2/themes/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/registration_screen.dart';
import 'authentication/user_information_screen.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';
import 'main_screens/home_screen.dart';
import 'providers/authentication_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  Future<void> getCurrentTheme() async {
    await Provider.of<MyThemeProvider>(context, listen: false).getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter ChatGpt',
          theme:
              MyTheme.themeData(isDarkTheme: value.themeType, context: context),
          initialRoute: Constants.landingScreen,
          routes: {
            Constants.landingScreen: (context) => const LandingScreen(),
            Constants.registrationScreen: (context) =>
                const RegistrationScreen(),
            Constants.homeScreen: (context) => const HomeScreen(),
            Constants.userInformationScreen: (context) =>
                const UserInformationScreen(),
          },
        );
      },
    );
  }
}
