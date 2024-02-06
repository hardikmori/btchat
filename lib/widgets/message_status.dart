import 'package:flutter/material.dart';

import '../constens/colors.dart';

Widget messageStatus() {
  return Column(
    
    children: [
    
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(28),
              child:
                  Image.asset("assets/images/profile1.jpg", fit: BoxFit.cover),
                  
            ),
          ),
        ),
      ),
      Text(
        "My Status",
        style: TextStyle(color: AppColors.colorwhitegrey),
      )
    ],
  );
}
