import 'package:blue_crew_chat/Screens/chat_screen.dart';
import 'package:blue_crew_chat/Screens/download_report.dart';
import 'package:blue_crew_chat/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chat-user.dart';

class DoctorUserCard extends StatefulWidget {
  final ChatUser user;
  const DoctorUserCard({super.key, required this.user});

  @override
  State<DoctorUserCard> createState() => _DoctorUserCardState();
}

class _DoctorUserCardState extends State<DoctorUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04, vertical: Get.height * 0.01 / 2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.03)),
      elevation: 0.5,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(_)=> DownloadUserReport(userEmail: widget.user.email,displayName: widget.user.name,)));
        },
        child: Container(
          height: Get.height*0.2,
          width: Get.width*0.5,
          // leading: CircleAvatar(child: Icon(Icons.person),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Get.height*0.3),
                child: CachedNetworkImage(
                  width: Get.height* 0.055,
                  height: Get.height* 0.055,
                  imageUrl: widget.user.image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context,url,error)=>CircleAvatar(child: Icon(Icons.person),),
                ),
              ),
              Text(widget.user.name),
              Text(
                widget.user.about,
                maxLines: 1,
              ),
            ],
          ),
          // trailing: Text('12:00 PM', style: TextStyle(color: Colors.black26)),
        ),
      ),
    );
  }
}
