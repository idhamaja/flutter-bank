import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/forms.dart';
import 'package:flutter_bank/bloc/auth/authBloc.dart';
import 'package:flutter_bank/bloc/auth/authEvent.dart';
import 'package:flutter_bank/bloc/auth/authState.dart';
import 'package:flutter_bank/models/signIn/signInFormModel.dart';
import 'package:flutter_bank/shared/sharedMethods.dart';
import 'package:flutter_bank/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailCtrl = TextEditingController(text: '');
  final passwordCtrl = TextEditingController(text: '');

  //function Validate
  bool validate() {
    //make sure email and password not null
    if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                width: 155,
                height: 230,
                margin: const EdgeInsets.only(
                  top: 55,
                  bottom: 35,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/bank_logo2.png',
                    ),
                  ),
                ),
              ),

              //
              Text(
                'Sign In &\nGrow Your Finance',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),

              //
              const SizedBox(height: 30),

              //
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),

                //
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE_EMAIL_INPUT
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Email Address',
                    //       style: blackTextStyle.copyWith(fontWeight: medium),
                    //     ),
                    //     //
                    //     const SizedBox(height: 8),
                    //     //TEXT_FORM_FIELD
                    //     TextFormField(
                    //       decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(14),
                    //         ),
                    //         contentPadding: const EdgeInsets.all(12),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    //NOTE_EMAIL_INPUT
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailCtrl,
                    ),

                    const SizedBox(height: 16),

                    //NOTE_PASSWORD_INPUT
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Password',
                    //       style: blackTextStyle.copyWith(fontWeight: medium),
                    //     ),
                    //     //
                    //     const SizedBox(height: 8),
                    //     //TEXT_FORM_FIELD
                    //     TextFormField(
                    //       obscureText: true,
                    //       decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(14),
                    //         ),
                    //         contentPadding: const EdgeInsets.all(12),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    //NOTE_PASSWORD_INPUT
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordCtrl,
                    ),

                    const SizedBox(height: 8),

                    //
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: blueTextStyle,
                      ),
                    ),

                    const SizedBox(height: 30),

                    //BUTTON_SIGN_IN
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     style: TextButton.styleFrom(
                    //       backgroundColor: buttonBlueColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           56,
                    //         ),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       'Sign In',
                    //       style: whiteTextStyle.copyWith(fontSize: 16),
                    //     ),
                    //   ),
                    // ),

                    //
                    CustomFilledButton(
                      title: 'Sign In',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailCtrl.text,
                                    password: passwordCtrl.text,
                                  ),
                                ),
                              );
                        } else {
                          //not validate
                          showCustomSnackbar(
                              context, 'Semua field harus diisi!');
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              //CREATE_NEW_ACCOUNT
              // SizedBox(
              //   width: double.infinity,
              //   height: 24,
              //   child: TextButton(
              //     onPressed: () {},
              //     style: TextButton.styleFrom(
              //       padding: EdgeInsets.zero,
              //     ),
              //     child: Text(
              //       'Create New Account',
              //       style: greyTextStyle.copyWith(fontSize: 16),
              //     ),
              //   ),
              // ),

              CustomTextButton(
                title: 'Create New Account',
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
              ),

              const SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
