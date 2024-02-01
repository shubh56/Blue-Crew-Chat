import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1, vertical: Get.height * 0.07),
          child: Column(
            children: [
              const Spacer(flex: 40),
              _buildGetStartedSection(),
              const Spacer(flex: 59),
              Container(
                height: Get.height * 0.05,
                width: Get.width * 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kOxBlue),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: Get.height * 0.018,
                      fontFamily: 'WorkSans',
                      color: kSeaSalt,
                    ),
                  ),
                  onPressed: () {
                    onTapLogin();
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Container(
                height: Get.height * 0.05,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: kSeaSalt,
                  borderRadius: BorderRadius.circular(Get.width * 0.3),
                ),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kSeaSalt),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: kOxBlue,
                            width: Get.width*0.002,
                          ),
                          borderRadius: BorderRadius.circular(
                            Get.width * 0.02,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: Get.height * 0.018,
                        fontFamily: 'WorkSans',
                        color: kOxBlue,
                      ),
                    ),
                    onPressed: () {
                      onTapSignUp();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGetStartedSection() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 41),
        child: Column(children: [
          Image.asset(
            'images/img_thumbs_up2.png',
            color: kOxBlue,
            height: Get.height*0.08,
            width: Get.width*0.5,
          ),
          SizedBox(height: Get.height*0.02),
          Text(
            "MediBuddy",
            style: TextStyle(
              color: kOxBlue,
              fontFamily: 'WorkSans',
              fontSize: Get.height*0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height*0.03,),
          Text(
            "Let's get started ",
            style: TextStyle(
              color: kOxBlue,
              fontFamily: 'WorkSans',
              fontSize: Get.height*0.02,
            ),
          ),
          SizedBox(height: Get.height*0.02),
          SizedBox(
            width: Get.width*0.9,
            child: Text(
              "Login to enjoy the feature's we have provided, and stay healthy",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kOxBlue,
                fontFamily: 'WorkSans',
                fontSize: Get.height*0.02,
              ),
            ),
          ),
        ],),);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin() {
    Get.toNamed('/LogInScreen');
  }

  onTapSignUp() {
    // TODO: implement Actions
  }
}
