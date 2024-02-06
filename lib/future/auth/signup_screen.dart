import 'package:btchat/constens/colors.dart';
import 'package:btchat/future/auth/onboarding.dart';
import 'package:btchat/future/auth/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final yourname = TextEditingController();
  final youremail = TextEditingController();
  final password = TextEditingController();
  final yourconfirmpassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign up with Email",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 20),
                    child: Text(
                      "Get chatting with friends and family today by signing up for our chat app!",
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: yourname,
                          decoration: InputDecoration(
                              labelText: 'Your Name',
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
                          controller: youremail,
                          decoration: InputDecoration(
                              labelText: 'Your Email',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.color86D)),
                              labelStyle: TextStyle(
                                color: AppColors.color86D,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please, Enter Email ID';
                            }
                            if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              labelText: 'Your Password',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.color86D)),
                              labelStyle: TextStyle(
                                color: AppColors.color86D,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Your Password.';
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
                          controller: yourconfirmpassword,
                          decoration: InputDecoration(
                              labelText: 'Your Confirm Password',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.color86D)),
                              labelStyle: TextStyle(
                                color: AppColors.color86D,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Your Confirm Password.';
                            } else if (value != password.text) {
                              return 'Passwords do not match';
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              backgroundColor: const Color(0xFF24786D)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool isLogin = await signup(
                                  email: youremail.text,
                                  pass: password.text,
                                  context: context);
                              if (isLogin) {
                                signupwithlogin();
                              }
                            }
                          },
                          child: const Text(
                            'Create an account',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
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

  Future<bool> signup(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Your Account has been Created,\nNow Please login'),
        backgroundColor: AppColors.color86D,
        elevation: 50,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
      return true;
    } catch (error) {
      // ignore: use_build_context_synchronously
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

  void signupwithlogin() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIScreenn(),
        ));
  }
}

// void emailSnackBar() {
//   const SnackBar(
//     content: Text(""),
//     backgroundColor: Colors.red,
//     elevation: 10,
//     behavior: SnackBarBehavior.floating,
//     margin: EdgeInsets.all(5),
//   );
// }
// void passwordSnackBar() {
//   const SnackBar(
//     content: Text('No user found for that email.'),
//     backgroundColor: Colors.red,
//     elevation: 10,
//     behavior: SnackBarBehavior.floating,
//     margin: EdgeInsets.all(5),
//   );
// }
