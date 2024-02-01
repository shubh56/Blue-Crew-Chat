import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blue_crew_chat/constants.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                kSeaSalt,
                kOxBlue,
              ],
            ),
          ),
          child: SizedBox(
            height: Get.height * 0.7,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.2,
                  ),
                  child: Image(
                    image: AssetImage('images/img_7xm_1.png'),
                    height: Get.height * 0.8,
                    width: Get.width * 0.8,
                    alignment: Alignment.topCenter,
                  ),
                ),
                _buildOnboardingOneNext(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOnboardingOneNext() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
            horizontal: Get.height * 0.05, vertical: Get.width * 0.06),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: Get.width * 0.8,
                margin: EdgeInsets.only(
                    left: Get.width * 0.1 / 3, right: Get.width * 0.1 / 3),
                child: Text(
                  "Find a lot of specialist doctors in one place",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: Get.height * 0.03,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Get.height * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/OnboardingFour');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.03, bottom: Get.width * 0.04),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontSize: Get.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                  ElevatedButton(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: Get.height * 0.02,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/OnboardingTwo');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
