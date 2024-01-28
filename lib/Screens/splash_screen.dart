import 'dart:async';

import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState(){
    Timer(const Duration(seconds: 8),(){
      if(Auth.authInstance.currentUser==null){
        Get.offAllNamed('/LogInScreen');
      }
      else{
        Get.offAllNamed('/HomeScreen');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOxBlue,
      body: Center(
        child: AnimatedTextKit(
          isRepeatingAnimation: true,
          totalRepeatCount: 4,
          animatedTexts: [
            TypewriterAnimatedText(
              'Blue Crew',
              textStyle: TextStyle(
                fontSize: Get.height * 0.05,
                color: kSeaSalt,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }
}
