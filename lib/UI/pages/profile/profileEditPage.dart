import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/forms.dart';
import 'package:flutter_bank/shared/themes.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

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
                const CustomFormField(
                  title: 'Username',
                ),

                const SizedBox(height: 16),

                //NOTE_FULL_NAME_INPUT
                const CustomFormField(
                  title: 'Full Name',
                ),

                const SizedBox(height: 16),

                //NOTE_EMAIL_INPUT
                const CustomFormField(
                  title: 'Email Address',
                ),

                const SizedBox(height: 16),

                //NOTE_PASSWORD_INPUT
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
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
