import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _handleGoogleButtonClick() {
    Auth.signInWithGoogle().then(
      (user) async {
        if(user!=null){
          if(await Auth.userExists()){
            Get.offAndToNamed('/HomeScreen');
          }
          else{
            await Auth.createUser().then((value) => Get.offAndToNamed('/HomeScreen'));
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(color: kSeaSalt, fontSize: Get.height * 0.02),
        centerTitle: true,
        backgroundColor: kOxBlue,
        iconTheme: IconThemeData(
          color: kSeaSalt,
          size: Get.height * 0.03,
        ),
        title: Text(
          'Blue Crew Chat',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.05,
              width: Get.width * 0.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kOxBlue),
                  foregroundColor: MaterialStatePropertyAll(kSeaSalt),
                ),
                onPressed: () {
                  _handleGoogleButtonClick();
                },
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.google),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    const Text('Sign in with Google'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
