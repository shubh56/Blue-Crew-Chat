import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blue_crew_chat/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../models/dialog_controller.dart';
import 'Auth/authentication.dart';

class UploadReportPatient extends StatefulWidget {
  const UploadReportPatient({super.key});

  @override
  State<UploadReportPatient> createState() => _UploadReportPatientState();
}

class _UploadReportPatientState extends State<UploadReportPatient> {
  final DialogController dialogController = Get.put(DialogController());

  PlatformFile? pickedFile;
  String? containerText;
  bool isVisible = false;
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf']);
    await Auth.uploadToStorage(result?.files.first).then((value) => {
      setState(() {
        pickedFile = result?.files.first;
        print(pickedFile?.name);
        containerText = result?.files.first.name;
        isVisible = true;
        dialogController.showUploadDialog();
      }),
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
                  "Upload your report for review by your doctor",
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
                onPressed: pickFile,
              ),
            )
          ],
        ),
      ),
    );
  }
}
