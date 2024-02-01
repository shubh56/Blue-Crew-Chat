import 'package:blue_crew_chat/Screens/profile_screen.dart';
import 'package:blue_crew_chat/Widgets/pharmacy_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blue_crew_chat/constants.dart';

import 'Auth/authentication.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleTextStyle: TextStyle(color: kSeaSalt, fontSize: Get.height * 0.02),
        centerTitle: true,
        backgroundColor: kOxBlue,
        iconTheme: IconThemeData(
          color: kSeaSalt,
          size: Get.height * 0.03,
        ),
        title: const Text('Home'),
      ),
      backgroundColor: kOxBlue,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.04,
              left: Get.width * 0.05,
              right: Get.width * 0.06,
            ),
            child: Container(
              height: Get.height * 0.04,
              width: Get.height * 0.5,
              child: Row(
                children: [
                  Text(
                    'Welcome to MediBuddy',
                    maxLines: 1,
                    style: TextStyle(
                      color: kSeaSalt,
                      fontSize: Get.height * 0.02,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.001,
                    width: Get.width * 0.01,
                  ),
                  Text(
                    Auth.userInstance.displayName!,
                    maxLines: 1,
                    style: TextStyle(
                      color: kSeaSalt,
                      fontSize: Get.height * 0.02,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height*0.04,
            width: double.maxFinite,
          ),
          PharmacyCard(
            nextPage: '/PharmacyScreen',
            text: 'Early protection for your family health',
            imagePath: 'images/img_7xm_6.png',
            buttonText: 'Go to Pharmacy',
          ),
          SizedBox(
            height: Get.height*0.02,
            width: double.maxFinite,
          ),
          PharmacyCard(
            nextPage: '/BMIInputPage',
            text: 'Early protection for your family health',
            imagePath: 'images/img_7xm_2.png',
            buttonText: 'Get Advice Now',
          ),
          SizedBox(
            height: Get.height*0.02,
            width: double.maxFinite,
          ),
          PharmacyCard(
            nextPage: '/UploadReportScreen',
            text: 'Early protection for your family health',
            imagePath: 'images/img_7xm_5.png',
            buttonText: 'Upload Report',
          ),
          SizedBox(
            height: Get.height*0.02,
            width: double.maxFinite,
          ),
          // Center(
          //   child: TextButton(
          //     child: Text(
          //       'Upload Report',
          //     ),
          //     onPressed: pickFile,
          //   ),
          // ),
        ],
      ),
    );
  }
}
