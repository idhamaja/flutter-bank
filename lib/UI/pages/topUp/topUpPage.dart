import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/bankItem.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/shared/themes.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),

          //
          Row(
            children: [
              Image.asset(
                'assets/card_small.png',
                width: 80,
              ),

              //
              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1991',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Cucung Murphy Sukardi',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 40),

          //
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),

          const SizedBox(height: 14),

          //
          BankItem(
            title: 'BANK BCA',
            imageUrl: 'assets/img_bank_bca.png',
            isSelected: true,
          ),

          BankItem(
            title: 'BANK BNI',
            imageUrl: 'assets/img_bank_bni.png',
          ),

          BankItem(
            title: 'BANK Mandiri',
            imageUrl: 'assets/img_bank_mandiri.png',
          ),

          BankItem(
            title: 'BANK OCBC',
            imageUrl: 'assets/img_bank_ocbc.png',
          ),

          //
          const SizedBox(height: 12),

          CustomFilledButton(
            title: 'Continue',
            onPressed: () {},
          ),

          const SizedBox(height: 58),
        ],
      ),
    );
  }
}
