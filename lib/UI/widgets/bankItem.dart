import 'package:flutter/material.dart';
import 'package:flutter_bank/shared/themes.dart';

class BankItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isSelected;

  const BankItem({
    super.key,
    required this.title,
    required this.imageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
          width: 3,
          color: isSelected ? blueColor : whiteColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '50 mins',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
