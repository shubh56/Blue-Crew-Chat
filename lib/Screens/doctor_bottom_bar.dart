import 'package:blue_crew_chat/Screens/chatbotFileUpload.dart';
import 'package:blue_crew_chat/chatbot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chat_home_screen.dart';
import 'doctor_home_screen.dart';
import 'doctor_profile_screen.dart';



class DoctorBottomBar extends StatefulWidget {
  const DoctorBottomBar({super.key});

  @override
  State<DoctorBottomBar> createState() => _BottomBarBunker();
}

class _BottomBarBunker extends State<DoctorBottomBar> {
  final navKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final items = const [
    const Icon(Icons.home, size: 30),
    const Icon(FontAwesomeIcons.solidMessage, size: 20),
    const Icon(FontAwesomeIcons.robot, size: 20),
  ];

  final screens = [
    const DoctorHomeScreen(),
    const ChatHomeScreen(),
    const ChatBotFileUpload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kOxBlue,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navKey,
        items: items,
        backgroundColor: kOxBlue,
        index: index,
        onTap: (index) => setState(() {
          this.index = index;
        }),
      ),
    );

  }
}