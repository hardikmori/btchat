import 'package:btchat/constens/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../common/custom_snakbar.dart';

class FirebaseAuthService {
  //Google Icon Login
  static Future<bool?> signInWithGoogle() async {
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

  //Facebook Icon Login
  //
  //
  //
  //
  //Apple Icon Login
  //
  //
  //
  //
  //Email Base creata a account
  Future<bool> signup(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Your Account has been Created,\nNow Please login'),
        backgroundColor: AppColors.color86D,
        elevation: 50,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Please Enter a Valid EmailID'),
        backgroundColor: AppColors.color86D,
        elevation: 50,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
      return false;
    }
  }

  //login
  Future login(
      {required String emails,
      required String passs,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emails, password: passs);
      customeSnakBar(context: context, message: '');
      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Please Provied a Vaild EmailId And Password'),
        backgroundColor: AppColors.color86D,
        elevation: 30,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
      return false;
    }
  }
}
