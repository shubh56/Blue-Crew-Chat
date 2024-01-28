import 'package:blue_crew_chat/Screens/chat_screen.dart';
import 'package:blue_crew_chat/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chat-user.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
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
          Navigator.push(context, MaterialPageRoute(builder:(_)=> ChatScreen(user: widget.user)));
        },
        child: ListTile(
          // leading: CircleAvatar(child: Icon(Icons.person),),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(Get.height*0.3),
            child: CachedNetworkImage(
              width: Get.height* 0.055,
              height: Get.height* 0.055,
              imageUrl: widget.user.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context,url,error)=>CircleAvatar(child: Icon(Icons.person),),
            ),
          ),
          title: Text(widget.user.name),
          subtitle: Text(
            widget.user.about,
            maxLines: 1,
          ),
          // trailing: Text('12:00 PM', style: TextStyle(color: Colors.black26)),
        ),
      ),
    );
  }
}
