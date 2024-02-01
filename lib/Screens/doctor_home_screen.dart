import 'dart:convert';
import 'package:blue_crew_chat/Screens/profile_screen.dart';
import 'package:blue_crew_chat/Widgets/chat_user_card.dart';
import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/doctor_home_user_card.dart';
import '../models/chat-user.dart';
import 'Auth/authentication.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  List<ChatUser> list = [];

  final List<ChatUser> _searchList = [];
  bool _isSearching = false;

  @override
  void initState() {
    Auth.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          backgroundColor: kOxBlue,
          appBar: AppBar(
            titleTextStyle:
            TextStyle(color: kSeaSalt, fontSize: Get.height * 0.02),
            centerTitle: true,
            backgroundColor: kOxBlue,
            iconTheme: IconThemeData(
              color: kSeaSalt,
              size: Get.height * 0.03,
            ),
            leading: Icon(CupertinoIcons.home),
            title: const Text(
              'Home',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                  });
                },
                icon: Icon(
                  _isSearching
                      ? CupertinoIcons.clear_circled_solid
                      : Icons.search,
                  size: Get.height * 0.03,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    ProfileScreen(user: Auth.me),
                  );
                },
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  size: Get.height * 0.03,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.04,
                    left: Get.width * 0.05,
                    right: Get.width * 0.06,
                  ),
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.height * 0.5,
                    child: Row(
                      children: [
                        Text(
                          'Welcome to MediBuddy',
                          maxLines: 1,
                          style: TextStyle(
                            color: kSeaSalt,
                            fontSize: Get.height * 0.02,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.001,
                          width: Get.width * 0.01,
                        ),
                        Text(
                          'Dr. ${Auth.userInstance.displayName!}',
                          maxLines: 1,
                          style: TextStyle(
                            color: kSeaSalt,
                            fontSize: Get.height * 0.02,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _isSearching,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 0.02,
                        vertical: Get.width * 0.04),
                    child: TextField(
                      onChanged: (value) {
                        //TODO: implement searching
                        _searchList.clear();
                        for (var i in list) {
                          if (i.name
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                              i.email
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                            _searchList.add(i);
                          }
                          setState(() {});
                        }
                      },
                      autofocus: true,
                      cursorColor: kOxBlue,
                      style: const TextStyle(
                        color: kOxBlue,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kOxBlue,
                          ),
                          borderRadius:
                          BorderRadius.circular(Get.height * 0.01),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kOxBlue,
                          ),
                          borderRadius:
                          BorderRadius.circular(Get.height * 0.01),
                        ),
                        hintText: 'Search User',
                        hintStyle: const TextStyle(
                          color: kOxBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: Auth.getAllUsers(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                      case ConnectionState.done:
                        final data = snapshot.data?.docs;
                        list = data
                            ?.map((e) => ChatUser.fromJson(e.data()))
                            .toList() ??
                            [];
                        if (list.isNotEmpty) {
                          return ListView.builder(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.01,
                            ),
                            itemCount:
                            _isSearching ? _searchList.length : list.length,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return DoctorUserCard(
                                  user: _isSearching
                                      ? _searchList[index]
                                      : list[index]);
                            },
                          );
                        } else {
                          //TODO: Beatuify THIS
                          return Text(
                            'No connections found',
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }


}
