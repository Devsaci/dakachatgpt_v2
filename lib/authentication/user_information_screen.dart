import 'package:dakachatgpt_v2/service/image_cache_manager.dart';
import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.yellowAccent,
                        backgroundImage: AssetImage(AssetsManager.userIcon),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt)),
                          ),
                        ),
                      )
                    ],
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
