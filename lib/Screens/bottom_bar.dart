import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../constants.dart';
import 'chat_home_screen.dart';
import 'home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_profile.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarBunker();
}

class _BottomBarBunker extends State<BottomBar> {
  final navKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final items = const [
    const Icon(Icons.home, size: 30),
    const Icon(FontAwesomeIcons.solidMessage, size: 20),
    const Icon(CupertinoIcons.person, size: 30),
  ];

  final screens = [
    const HomeScreen(),
    const ChatHomeScreen(),
    const UserProfile(),
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