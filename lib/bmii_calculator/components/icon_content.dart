import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          text,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
