import 'package:flutter/material.dart';


const kOxBlue = Color(0xff011638);
const kIndBlue = Color(0xff8e94f2);
const kSeaSalt = Color(0xfff9f9f9);
const kCharcoal = Color(0xff294C60);

const kTextInputDecoration = InputDecoration(
  suffixIcon: Icon(Icons.delete_outline_rounded),
  suffixIconColor: Colors.blueGrey,
  filled: true,
  fillColor: kCharcoal,
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.blueGrey,
    fontFamily: 'WorkSans',
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kCharcoal, width: 5.0),
    borderRadius: BorderRadius.all(Radius.circular(70.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kCharcoal, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);


const Color kActiveCardColour = Color(0xFF1D1E33);
const Color kInactiveCardColour = Color(0xFF111328);
const Color kBottomContainerColour = Color(0xFFEB1555);

const kLabelStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFF8D8E98),
);

const kMainLabelStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kButtonTextStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.bold,
);
