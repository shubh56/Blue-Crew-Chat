import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  RxBool isDialogVisible = false.obs;

  void showUploadDialog() {
    isDialogVisible.value = true;
    Get.dialog(
      AlertDialog(
        title: Text('Report Downloaded', style: TextStyle(color: kOxBlue,fontSize: Get.height*0.04,fontFamily: 'WorkSans')),
        icon: Icon(CupertinoIcons.check_mark),
        iconColor: kOxBlue,
        actions: [
          TextButton(
            onPressed: () {
              hideUploadDialog();
            },
            child: Text('OK', style: TextStyle(fontFamily: 'WorkSans', fontSize: Get.height*0.02,)),
          ),
        ],
      ),
    );
  }

  void hideUploadDialog() {
    isDialogVisible.value = false;
    Get.toNamed('/DoctorBottomBar');
  }
}
