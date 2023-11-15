import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/forms.dart';
import 'package:flutter_bank/UI/widgets/transferRecentUserItems.dart';
import 'package:flutter_bank/shared/themes.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildRecentUsers(),
        ],
      ),
    );
  }

  //
  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const TransferRecentUserItems(
            imageUrl: 'assets/img_friend1.png',
            name: 'Munaroh',
            username: 'moena',
            isVerified: true,
          ),

          //
          const TransferRecentUserItems(
            imageUrl: 'assets/img_friend2.png',
            name: 'Ncum',
            username: 'ncoem12',
          ),

          //
          const TransferRecentUserItems(
            imageUrl: 'assets/img_friend3.png',
            name: 'Ujang Jackson',
            username: 'djangJ',
          ),
        ],
      ),
    );
  }
}
