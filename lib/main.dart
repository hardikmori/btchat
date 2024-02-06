import 'package:btchat/firebase_options.dart';
import 'package:btchat/future/auth/onboarding.dart';
import 'package:btchat/future/auth/signin_screen.dart';
import 'package:btchat/future/auth/signup_screen.dart';
import 'package:btchat/future/splash/splash_screen.dart';
import 'package:btchat/future/ui/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, context) {
          return MaterialApp(
            title: 'Flutter Demo',
            initialRoute: '/splash',
            routes: {
              '/splash': (context) => const SplashScreen(),
              '/sign-up': (context) => const SignUpScreen(),
              '/sign-in': (context) => const SignIScreenn(),
              '/Onboarding': (context) => const Onboarding(),
              '/home': (context) => const Navbar(),
            },
          );
        });
  }
}
