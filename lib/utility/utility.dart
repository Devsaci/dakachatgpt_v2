import 'dart:io';

import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}

Future<File?> pickImage({
  required BuildContext context,
  required bool fromCamera,
}) async {
  File? fileImage;

  if (fromCamera) {
    try {} catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  } else {}
  return fileImage;
}
