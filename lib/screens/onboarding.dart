import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';
import 'package:tasky_app/screens/onboarding_preferances.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String routeName = "Onboarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardingData> onBoardingList = dataOnboarding();
  int index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image onboarding
            SizedBox(
              height: 200,

              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(onBoardingList[index].image);
                },
              ),
            ),
            //Indicator onboarding
            SizedBox(height: 27),
            //indicator
            SmoothPageIndicator(
              controller: controller,
              count: onBoardingList.length,
              effect: ExpandingDotsEffect(
                spacing: 8,
                radius: 56,
                dotWidth: 15,
                dotHeight: 4,
                dotColor: Color(0xffAFAFAF),
                activeDotColor: Color(0xff5F33E1),
              ),
            ),
            SizedBox(height: 50),
            //Text inboarding
            Text(
              onBoardingList[index].title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Color(0xff24252C),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 42),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Text(
                onBoardingList[index].description,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: Color(0xff6E6A7C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 107),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () async {
                    if (index < onBoardingList.length - 1) {
                      controller.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {
                      await OnboardingPreferences.setHasSeenOnboarding();
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    }
                  },
                  color: Color(mainColor),
                  height: 48,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    onBoardingList[index].buttonText,

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//data class
class OnboardingData {
  final String title;
  final String description;
  final String image;
  final String buttonText;
  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
    required this.buttonText,
  });
}

//data onboarding
List<OnboardingData> dataOnboarding() {
  return [
    OnboardingData(
      title: "Manage your tasks",
      description:
          "You can easily manage all of your daily tasks in DoMe for free",
      image: AssetsConstants.onboarding1,
      buttonText: 'Next',
    ),
    OnboardingData(
      title: 'Create daily routine',
      description:
          "In Tasky  you can create your personalized routine to stay productive",
      image: AssetsConstants.onboarding2,
      buttonText: 'Next',
    ),
    OnboardingData(
      title: 'Orgonaize your tasks',
      description:
          "You can organize your daily tasks by adding your tasks into separate categories",
      image: AssetsConstants.onboarding3,
      buttonText: 'Get Started',
    ),
  ];
}
