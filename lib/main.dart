import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/pages/home/homePage.dart';
import 'package:flutter_bank/UI/pages/onBoardingPage.dart';
import 'package:flutter_bank/UI/pages/profile/profilePage.dart';
import 'package:flutter_bank/UI/pages/signInPage.dart';
import 'package:flutter_bank/UI/pages/signUpPage.dart';
import 'package:flutter_bank/UI/pages/signUp_Set_ProfilePage.dart';
import 'package:flutter_bank/UI/pages/signUp_Set_ktpPage..dart';
import 'package:flutter_bank/UI/pages/signUp_Success_Page.dart';
import 'package:flutter_bank/UI/pages/splashPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      routes: {
        '/': (context) => const SplashPage(),
        '/onBoarding': (context) => const OnBoardingPage(),
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/signUp-setProfile': (context) => const SignUpSetProfilePage(),
        '/signUp-setKtp': (context) => const SignUpSetKtpPage(),
        '/signUp-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
