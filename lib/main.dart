import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/pages/home/homePage.dart';
import 'package:flutter_bank/UI/pages/onBoardingPage.dart';
import 'package:flutter_bank/UI/pages/pin_number/pinPage.dart';
import 'package:flutter_bank/UI/pages/profile/profileEditPage.dart';
import 'package:flutter_bank/UI/pages/profile/profileEditPinPage.dart';
import 'package:flutter_bank/UI/pages/profile/profileEditSuccessfullyPage.dart';
import 'package:flutter_bank/UI/pages/profile/profilePage.dart';
import 'package:flutter_bank/UI/pages/sign_in/signInPage.dart';
import 'package:flutter_bank/UI/pages/sign_up/signUpPage.dart';
import 'package:flutter_bank/UI/pages/sign_up/signUp_Set_ProfilePage.dart';
import 'package:flutter_bank/UI/pages/sign_up/signUp_Set_ktpPage..dart';
import 'package:flutter_bank/UI/pages/sign_up/signUp_Success_Page.dart';
import 'package:flutter_bank/UI/pages/splashPage.dart';
import 'package:flutter_bank/UI/pages/topUp/topUpAmountPage.dart';
import 'package:flutter_bank/UI/pages/topUp/topUpPage.dart';
import 'package:flutter_bank/UI/pages/topUp/topUpSuccessfully.dart';
import 'package:flutter_bank/shared/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
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
        '/pin': (context) => const PinPage(),
        '/profile-edit': (context) => const ProfileEditPage(),
        '/profile-edit-pin': (context) => const ProfileEditPinPage(),
        '/profile-edit-success': (context) =>
            const ProfileEditSuccessfullyPage(),
        '/topup': (context) => const TopUpPage(),
        '/topup-amount': (context) => const TopUpAmountPage(),
        '/topup-success': (context) => const TopUpSuccessfullyPage(),
      },
    );
  }
}
