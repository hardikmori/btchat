//import 'package:btchat/firebase_auth_service/firebase_auth_service.dart';
import 'package:btchat/future/ui/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/svg.dart';

class CusSingButton extends StatefulWidget {
  const CusSingButton({super.key});

  @override
  State<CusSingButton> createState() => _CusSingButtonState();
}

class _CusSingButtonState extends State<CusSingButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 50.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.facebook,
                color: Colors.blue,
                size: 35,
              ),
            )),
        SizedBox(
          width: 20.w,
        ),
        Container(
            width: 50.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white)),
            child: IconButton(
              onPressed: () async {
                bool? isDone = await signInWithGoogle();
                if (isDone!) {
                  signnavigator();
                }
              },
              icon:
                  SvgPicture.asset("assets/svg/google-icon.svg", height: 25.h),
            )),
        SizedBox(
          width: 20.w,
        ),
        Container(
            width: 50.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.apple,
                color: Colors.white,
                size: 35,
              ),
            )),
      ],
    );
  }

  Future<bool?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (error) {
      // Handle the error
      // ignore: avoid_print
      print("Error signing in with Google: $error");
      // You might want to throw or return a specific error here
      // Rethrow the error to allow the calling code to handle it
      return false;
    }
  }

  void signnavigator() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Navbar(),
        ));
  }
}
