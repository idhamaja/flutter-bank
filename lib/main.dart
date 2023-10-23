import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/pages/onBoardingPage.dart';
import 'package:flutter_bank/UI/pages/signInPage.dart';
import 'package:flutter_bank/UI/pages/signUpPage.dart';
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
      },
    );
  }
}
