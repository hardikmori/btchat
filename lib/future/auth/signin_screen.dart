import 'package:btchat/constens/colors.dart';
// import 'package:btchat/firebase_auth_service/firebase_auth_service.dart';
import 'package:btchat/future/auth/onboarding.dart';
import 'package:btchat/future/ui/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIScreenn extends StatefulWidget {
  const SignIScreenn({super.key});

  @override
  State<SignIScreenn> createState() => _SignIScreennState();
}

class _SignIScreennState extends State<SignIScreenn> {
  final youremail = TextEditingController();
  final password = TextEditingController();

  //AppAuthentication _appAuthentication = AppAuthentication();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void _submitForm() {
  //   // if (_formKey.currentState!.validate()) {
  //   //   print('submit btn prees');
  //   //   Navigator.push(
  //   //       context,
  //   //       MaterialPageRoute(
  //   //         builder: (context) => const Navbar(),
  //   //       ));
  //   // }
  //   // Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //       builder: (context) => const Navbar(),
  //   //     ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Onboarding(),
                  ));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log in to Chatbox",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32, right: 20),
                child: Text(
                  "Welcome back! Sign in using your social account or email to continue us",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.black)),
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
                          border: Border.all(color: Colors.black)),
                      child: IconButton(
                        onPressed: () async {
                          await signInWithGoogle();
                          loginnavigator();
                        },
                        icon: SvgPicture.asset("assets/svg/google-icon.svg",
                            height: 25.h),
                      )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                      width: 50.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.black)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: 35,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              const Center(
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: youremail,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.color86D)),
                              labelStyle: TextStyle(
                                color: AppColors.color86D,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name.';
                            }
                            return null; // Return null if the name is valid
                          },
                          onSaved: (value) {
                            //_name = value!; //Save the entered name
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.color86D)),
                              labelStyle: TextStyle(color: AppColors.color86D)),
                          validator: (value) {
                            // Validation function for the email field
                            if (value!.isEmpty) {
                              return 'Please enter your email.'; // Return an error message if the email is empty
                            }
                            // You can add more complex validation logic here
                            return null; // Return null if the email is valid
                          },
                          onSaved: (value) {
                            //  _email = value!; // Save the entered email
                          },
                        ),
                        SizedBox(height: 120.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              backgroundColor: const Color(0xFF24786D)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool isLogin = await login(
                                  emails: youremail.text,
                                  passs: password.text,
                                  context: context);
                              if (isLogin) {
                                loginnavigator();
                              }
                            }
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10.h,
              ),
              const Center(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Color(0xFF24786D)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future login(
      {required String emails,
      required String passs,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emails, password: passs);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Your Are LogIn Sucessfull'),
        backgroundColor: AppColors.color86D,
        elevation: 50,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
      return true;
    } catch (error) {
      // ignore: use_build_context_synchronously
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

  void loginnavigator() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Navbar(),
        ));
  }
}
