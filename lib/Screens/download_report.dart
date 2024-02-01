import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blue_crew_chat/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import '../models/dialog_controller.dart';
import 'Auth/authentication.dart';

class DownloadUserReport extends StatefulWidget {
  final String userEmail;
  final String displayName;
  const DownloadUserReport({super.key, required this.userEmail , required this.displayName});

  @override
  State<DownloadUserReport> createState() => _DownloadUserReportState();
}

class _DownloadUserReportState extends State<DownloadUserReport> {
  final DialogController dialogController = Get.put(DialogController());



  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _downloadFromStorage() async {

  final storageRef = FirebaseStorage.instance.ref();
  //
  // final pathReference = storageRef.child("images/stars.jpg");
  //
  // final gsReference =
  // FirebaseStorage.instance.refFromURL("gs://blue-crew-chat.appspot.com/shubhharde158@gmail.com");
  //
  // final httpsReference = FirebaseStorage.instance.refFromURL(
  //     "https://firebasestorage.googleapis.com/b/blue-crew-chat.appspot.com/o/sem%20VI%20TT.pdf");

  final imageUrl = await storageRef.child("/shubhharde158@gmail.com/JASBIR.pdf").getDownloadURL();
  print(imageUrl);

    final Uri url = Uri.parse(imageUrl);
    _launchUrl(url);

    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration:  BoxDecoration(
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
                  "Download report provided by: ${widget.displayName}",
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
              child:ElevatedButton(
                child: Container(
                  height: Get.height*0.06,
                  width: Get.height*0.4,
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: Get.height * 0.03,
                      ),
                    ),
                  ),
                ),
                onPressed: _downloadFromStorage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
