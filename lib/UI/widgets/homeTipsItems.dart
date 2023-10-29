import 'package:flutter/material.dart';
import 'package:flutter_bank/shared/themes.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeTipsItems extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String url;

  const HomeTipsItems({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await launchUrlString(url)) {
          launchUrlString(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imgUrl,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
