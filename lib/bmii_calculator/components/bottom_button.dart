import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function? onBtnPressed;

  BottomButton({required this.buttonText, this.onBtnPressed, required Null Function() onPressed, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 80.0,
        width: double.infinity,
        color: kBottomContainerColour,
        child: Center(
          child: Text(
            buttonText,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
