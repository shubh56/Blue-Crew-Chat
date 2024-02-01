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
          if(user.user?.email=='shubhharde158@gmail.com'){
            if (await Auth.userExists()) {
              Get.toNamed('/DoctorBottomBar');
            }
          }
            else{
              if (await Auth.userExists()) {
                Get.toNamed('/BottomBar');
              }
              else{
                await Auth.createUser().then((value) => Get.toNamed('/BottomBar'));
              }
            }


        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOxBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Get.height * 0.044,
              top: Get.height * 0.02,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Email or Username',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: Get.height * 0.02,
                  color: kSeaSalt,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.02,
            ),
            child: Container(
              width: Get.width * 0.8,
              child: TextField(
                  decoration: kTextInputDecoration.copyWith(
                    suffixIcon: const Icon(Icons.person),
                    hintText: 'Enter Email',
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Get.height * 0.044,
              top: Get.height * 0.01,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: Get.height * 0.02,
                  color: kSeaSalt,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.02,
            ),
            child: Container(
              width: Get.width * 0.8,
              child: TextField(
                  decoration: kTextInputDecoration.copyWith(
                    suffixIcon: const Icon(CupertinoIcons.lock_fill),
                    hintText: 'Enter Password',
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.01,
              right: Get.height * 0.06,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: Get.height * 0.02,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.02,
            ),
            child: SizedBox(
              width: Get.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Calendar');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.02, bottom: Get.height * 0.02),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.02,
            ),
            child: Text(
              'or login with',
              style: TextStyle(
                color: kSeaSalt,
                fontSize: Get.height * 0.02,
              ),
            ),
          ),
          IconButton(onPressed: (){
            _handleGoogleButtonClick();
          }, icon: Icon(FontAwesomeIcons.google), color: kSeaSalt),
        ],
      ),
    );
  }
}
