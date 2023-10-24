import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bank/shared/themes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const OnBoardingPage(),
      //   ),
      // );
      Navigator.pushNamedAndRemoveUntil(
          context, '/onBoarding', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/bank_logo2.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
