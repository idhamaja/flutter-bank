import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/forms.dart';
import 'package:flutter_bank/UI/widgets/formsPassword.dart';
import 'package:flutter_bank/bloc/auth/authBloc.dart';
import 'package:flutter_bank/bloc/auth/authState.dart';
import 'package:flutter_bank/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameCtrl = TextEditingController(text: '');
  final nameCtrl = TextEditingController(text: '');
  final emailCtrl = TextEditingController(text: '');
  final passwordCtrl = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameCtrl.text = authState.user.username!;
      nameCtrl.text = authState.user.name!;
      emailCtrl.text = authState.user.email!;
      passwordCtrl.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
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
                //NOTE_USERNAME_INPUT
                CustomFormField(
                  title: 'Username',
                  controller: usernameCtrl,
                ),

                const SizedBox(height: 16),

                //NOTE_FULL_NAME_INPUT
                CustomFormField(
                  title: 'Full Name',
                  controller: nameCtrl,
                ),

                const SizedBox(height: 16),

                //NOTE_EMAIL_INPUT
                CustomFormField(
                  title: 'Email Address',
                  controller: emailCtrl,
                ),

                const SizedBox(height: 16),

                //NOTE_PASSWORD_INPUT
                CustomFormFieldPassword(
                  title: 'Password',
                  controller: passwordCtrl,
                ),

                const SizedBox(height: 30),

                //
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-edit-success', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
