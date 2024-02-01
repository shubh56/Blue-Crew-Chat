import 'package:blue_crew_chat/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chat-user.dart';
import 'Auth/authentication.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser? user;

  const ProfileScreen({super.key,  this.user});



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Get.width * 0.03,
        ),
        color: kSeaSalt,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Get.height*0.04),
            child: Text(
              widget.user!.name,
              style: TextStyle(fontSize: Get.height * 0.03, color: kOxBlue),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(Get.height*0.3/2/2),
            child: CachedNetworkImage(
              width: Get.height* 0.3/2,
              height: Get.height* 0.3/2,
              fit: BoxFit.fill,
              imageUrl: widget.user!.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context,url,error)=>CircleAvatar(child: Icon(Icons.person),),
            ),
          ),
          SizedBox(
            height: Get.height*0.02,
            width: double.infinity,
          ),
          Text(
            widget.user!.email,
            style: TextStyle(fontSize: Get.height * 0.02, color: kOxBlue),
          ),
          SizedBox(
            height: Get.height*0.02,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kOxBlue),
                ),
                onPressed: () {
                  Auth.signOutFromGoogle();
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.pen),
                    SizedBox(height: Get.height*0.03,width: Get.width*0.03/2,),
                    Text('Update'),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height*0.04,
                width: Get.width*0.04,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kOxBlue),
                ),
                onPressed: () async {
                  await Auth.signOutFromGoogle().then((value) => Get.offAndToNamed('/LogInScreen'));
                },
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(height: Get.height*0.03,width: Get.width*0.03/2,),
                    Text('Log Out',),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
