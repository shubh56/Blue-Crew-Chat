import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdviceToPatient extends StatefulWidget {
  const AdviceToPatient({super.key});

  @override
  State<AdviceToPatient> createState() => _AdviceToPatientState();
}

class _AdviceToPatientState extends State<AdviceToPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOxBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleTextStyle: TextStyle(color: kSeaSalt, fontSize: Get.height * 0.02),
        centerTitle: true,
        backgroundColor: kOxBlue,
        iconTheme: IconThemeData(
          color: kSeaSalt,
          size: Get.height * 0.03,
        ),
        title: const Text('Expert Advice'),
      ),
    );
  }
}
