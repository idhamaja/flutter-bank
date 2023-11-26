import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/pages/sign_up/signUp_Set_ProfilePage.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/forms.dart';
import 'package:flutter_bank/bloc/auth/authBloc.dart';
import 'package:flutter_bank/bloc/auth/authEvent.dart';
import 'package:flutter_bank/bloc/auth/authState.dart';
import 'package:flutter_bank/models/signUp/signUpFormModel.dart';
import 'package:flutter_bank/shared/sharedMethods.dart';
import 'package:flutter_bank/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameContrl = TextEditingController(text: '');
  final emailContrl = TextEditingController(text: '');
  final passwordContrl = TextEditingController(text: '');

  //funtValidate
  bool validate() {
    if (nameContrl.text.isEmpty ||
        emailContrl.text.isEmpty ||
        passwordContrl.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpSetProfilePage(
                  data: SignUpFormModel(
                    name: nameContrl.text,
                    email: emailContrl.text,
                    password: passwordContrl.text,
                  ),
                ),
              ),
            );
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
                'Join Us to Unlock\nYour Growth.',
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
                    //NOTE_FULL_NAME_INPUT
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameContrl,
                    ),

                    const SizedBox(height: 16),

                    //NOTE_EMAIL_INPUT
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailContrl,
                    ),

                    const SizedBox(height: 16),

                    //NOTE_PASSWORD_INPUT
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordContrl,
                    ),

                    const SizedBox(height: 30),

                    //
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailContrl.text));
                        } else {
                          showCustomSnackbar(
                              context, 'Semua field harus diisi !!!');
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/signIn');
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
