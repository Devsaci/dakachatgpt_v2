import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../service/image_cache_manager.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: '33',
    countryCode: 'FR',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'France',
    example: 'France',
    displayName: 'France',
    displayNameNoCountryCode: 'FR',
    e164Key: '',
  );
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
                      backgroundImage: AssetImage(AssetsManager.openAILogo),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Add your phone number. I will send you a verification code.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    maxLength: 10,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      hintStyle: const TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.orangeAccent),
                      ),
                      prefixIcon: Container(
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 500),
                              onSelect: (value) {
                                setState(() {});
                              },
                            );
                          },
                          child: const Icon(
                            Icons.phone_android,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
