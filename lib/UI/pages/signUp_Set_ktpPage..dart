import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/shared/themes.dart';

class SignUpSetKtpPage extends StatelessWidget {
  const SignUpSetKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
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
            'Verify Your\nAccount.',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //UPLOAD_IMAGE
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgroundColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/ic_upload.png',
                      width: 32,
                    ),
                  ),
                ),
                // Container(
                //   width: 120,
                //   height: 120,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage(
                //         'assets/img_profile.png',
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(height: 16),

                Text(
                  'Passport/ID Card',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),

                const SizedBox(height: 40),

                //
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUp-success');
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          //SKIP
          CustomTextButton(
            title: 'Skip for Now',
            onPressed: () {
              Navigator.pushNamed(context, '/signUp-success');
            },
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
