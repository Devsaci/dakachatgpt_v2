import 'package:dakachatgpt_v2/service/image_cache_manager.dart';
import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

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
                  Center(
                    child: Stack(
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
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      // Enter your name
                      myTextFormFiled(
                        enabled: true,
                        textEditingController: nameController,
                        textInputType: TextInputType.name,
                        maxLines: 1,
                        maxLength: 25,
                        icon: Icons.account_circle,
                        hintText: 'Enter your name',
                      ),
                      const SizedBox(height: 20),
                      //Enter your phone number
                      TextFormField(),
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

  TextFormField myTextFormFiled({
    required bool enabled,
    required TextEditingController textEditingController,
    required TextInputType textInputType,
    required int maxLines,
    required int maxLength,
    required IconData icon,
    required String hintText,
  }) {
    return TextFormField(
      enabled: enabled,
      controller: textEditingController,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        prefixIcon: Container(
          decoration: BoxDecoration(),
          child: Icon(icon, size: 20, color: Colors.black),
        ),
      ),
    );
  }
}
