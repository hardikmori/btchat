import 'package:btchat/future/auth/signin_screen.dart';
import 'package:btchat/future/auth/signup_screen.dart';
import 'package:btchat/widgets/cus_sign_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(7),
              // end: Alignment.bottomLeft,
              stops: [-1, 0.4, 0.8],
              colors: [Colors.black87, Color(0xff43116A), Colors.black87]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 23.h,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 06.w,
                  ),
                  Text(
                    'Chatbox',
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Connect\nfriends\neasily &\nquickly",
                  style: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 05.h,
              ),
              Text(
                "Our chaat app is the perfect way to stay connected with friends and family.",
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              ),
              SizedBox(
                height: 35.h,
              ),
              const CusSingButton(),
              SizedBox(
                height: 32.h,
              ),
              const Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(
                  "  OR  ",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(child: Divider()),
              ]),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.only(right: 100, left: 100))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: Text(
                    "Sign up withn mail",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Existing Account?",
                    style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIScreenn(),
                            ));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      )),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
