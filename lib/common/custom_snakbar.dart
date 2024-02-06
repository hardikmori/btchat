import 'package:flutter/material.dart';

import '../constens/colors.dart';

void customeSnakBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.color86D,
      elevation: 50,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
    ),
  );
}
