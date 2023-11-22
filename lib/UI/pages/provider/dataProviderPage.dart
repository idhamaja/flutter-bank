import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/dataProviderItems.dart';
import 'package:flutter_bank/shared/themes.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'From Wallet',
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
                    'Balance: Rp. 180.000.000',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),

          const SizedBox(height: 40),

          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),

          const SizedBox(height: 14),

          const DataProviderItems(
            name: 'Telkomsel',
            imgUrl: 'assets/img_provider_telkomsel.png',
            isSelected: true,
          ),

          //
          const DataProviderItems(
            name: 'Indoesat Ooredoo',
            imgUrl: 'assets/img_provider_indosat.png',
          ),

          //
          const DataProviderItems(
            name: 'Singtel ID',
            imgUrl: 'assets/img_provider_singtel.png',
          ),

          const SizedBox(height: 135),

          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/data-package');
            },
          ),

          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
