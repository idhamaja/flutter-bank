import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/pages/signInPage.dart';
import 'package:flutter_bank/shared/themes.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow your\nfinancial today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];

  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/img_onboarding1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),

            //
            const SizedBox(height: 80),

            //
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  //TITLES
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  //
                  const SizedBox(height: 26),

                  //SUBTITLES
                  Text(
                    subtitles[currentIndex],
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: currentIndex == 2 ? 38 : 50),

                  //check button getting started
                  //
                  currentIndex == 2
                      ? Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: buttonBlueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      56,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Get Started',
                                  style: whiteTextStyle.copyWith(fontSize: 16),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            //SIGN_IN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 24,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignInPage(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'Sign In',
                                  style: greyTextStyle.copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 0
                                    ? blueColor
                                    : lightBackgroundColor,
                              ),
                            ),

                            //
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 1
                                    ? blueColor
                                    : lightBackgroundColor,
                              ),
                            ),

                            //
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 2
                                    ? blueColor
                                    : lightBackgroundColor,
                              ),
                            ),

                            //
                            const Spacer(),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: buttonBlueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      56,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Continue',
                                  style: whiteTextStyle.copyWith(fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
