import 'dart:io';

import 'package:dakachatgpt_v2/service/image_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../providers/authentication_provider.dart';
import '../utility/utility.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? finalImageFile;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    phoneController.text = authProvider.phoneNumber;
    super.initState();
  }

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  Future<void> selectImage(bool fromCamera) async {
    finalImageFile = await pickImage(context: context, fromCamera: fromCamera);
    cropImage(finalImageFile!.path);
  }

  void popThePickImageDialog() {
    Navigator.pop(context);
  }

  Future<void> cropImage(filePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxHeight: 800,
      maxWidth: 800,
    );
    popThePickImageDialog();
    if (croppedFile != null) {
      setState(() {
        finalImageFile = File(croppedFile.path);
      });
    }
  }

  showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: const Text("Please choose an option",
              style: TextStyle(fontSize: 15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => selectImage(true),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.camera_alt, color: Colors.purple),
                    ),
                    Text("Camera"),
                  ],
                ),
              ),
              InkWell(
                onTap: () => selectImage(false),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.image_outlined, color: Colors.purple),
                    ),
                    Text("Gallery"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                  Center(
                    child: finalImageFile == null
                        ? Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.yellowAccent,
                                backgroundImage:
                                    AssetImage(AssetsManager.userIcon),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(35)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: IconButton(
                                        onPressed: () {
                                          //selectImage(false);
                                          showImagePickerDialog();
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.deepPurple,
                                backgroundImage: FileImage(
                                  File(finalImageFile!.path),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(35)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        //selectImage(false);
                                        showImagePickerDialog();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
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
                        myTextFormFiled(
                          enabled: true,
                          textEditingController: phoneController,
                          textInputType: TextInputType.number,
                          maxLines: 1,
                          maxLength: 25,
                          icon: Icons.phone,
                          hintText: 'Enter your phone number',
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RoundedLoadingButton(
                            controller: btnController,
                            onPressed: () {},
                            successIcon: Icons.check,
                            successColor: Colors.green,
                            errorColor: Colors.red,
                            color: Colors.deepPurple,
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5),
                            ),
                          ),
                        )
                      ],
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
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.deepPurple,
          ),
          child: Icon(icon, size: 20, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Colors.purple.shade50,
        filled: true,
      ),
    );
  }

  // store user data to fireStore
  void saveUserDataToFireStore() {}
}
