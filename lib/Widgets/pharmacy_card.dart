import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PharmacyCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final String buttonText;
  final String nextPage;
  const PharmacyCard({super.key, required this.text, required this.imagePath, required this.buttonText,required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade700,
          Colors.blue.shade600,
        ]),
        borderRadius: BorderRadius.circular(Get.width * 0.05),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: Get.width * 0.04,
                ),
                width: Get.width * 0.6,
                child: Text(
                  text,
                  maxLines: 2,
                  style: TextStyle(
                    color: kSeaSalt,
                    fontFamily: 'WorkSans',
                    fontSize: Get.height * 0.02,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height*0.02,
                width: Get.width*0.04,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kSeaSalt),
                  foregroundColor: MaterialStatePropertyAll(Colors.blue.shade900),
                ),
                onPressed: () {
                  Get.toNamed(nextPage);
                },
                child: Row(
                  children: [
                    Text(buttonText,style: TextStyle(fontFamily: 'WorkSans'),),
                    SizedBox(width: Get.width*0.03),
                    Icon(CupertinoIcons.chevron_right),
                  ],
                ),
              )
            ],
          ),
          Image.asset(imagePath, height: Get.height*0.2, width: Get.width*0.2),
        ],
      ),
    );
  }
}
