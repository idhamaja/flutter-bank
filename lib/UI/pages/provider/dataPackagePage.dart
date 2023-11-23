import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/forms.dart';
import 'package:flutter_bank/UI/widgets/packageItems.dart';
import 'package:flutter_bank/shared/themes.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),

          //put form number
          const SizedBox(height: 14),

          CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),

          const SizedBox(height: 40),

          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),

          //card package
          const SizedBox(height: 14),

          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              //Price_Amount

              PackageItems(
                amount: 10,
                price: 100000,
              ),

              PackageItems(
                amount: 25,
                price: 120000,
                isSelected: true,
              ),

              PackageItems(
                amount: 40,
                price: 150000,
              ),

              PackageItems(
                amount: 99,
                price: 300000,
              ),
            ],
          ),
          const SizedBox(height: 85),

          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data-success', (route) => false);
              }
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
