import 'package:blue_crew_chat/constants.dart';
import 'package:blue_crew_chat/helper/my_date_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/Auth/authentication.dart';
import '../models/message.dart';

class MessageCard extends StatefulWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Auth.userInstance.uid == widget.message.fromId ? _whiteMessage() : _blueMessage();
  }

  Widget _blueMessage() {
    if(widget.message.read.isEmpty){
      Auth.updateMessageReadStatus(widget.message);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: kOxBlue,
              borderRadius: BorderRadius.all(Radius.circular(Get.width*0.03)),
            ),
            padding: EdgeInsets.symmetric(horizontal:Get.height*0.02,vertical: Get.width*0.02,),
            margin: EdgeInsets.symmetric(horizontal: Get.height*0.02,vertical: Get.width*0.01),
            child: Text(widget.message.msg, style: TextStyle(
              fontSize: Get.height*0.02,
              color: kSeaSalt,
            ),),
          ),
        ),
        Row(
          children: [


            Text(MyDateUtil.getFormattedTime(context: context, time: widget.message.sent), style: TextStyle(fontSize: Get.height*0.015,color: Colors.grey),),
            SizedBox(width: Get.width*0.02),

          ],
        ),
      ],
    );
  }

  Widget _whiteMessage() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [
            SizedBox(width: Get.width*0.02),
            if(widget.message.read.isNotEmpty)
              Icon(Icons.done_all_rounded, color: Colors.blue, size: Get.height*0.02,),
            SizedBox(width: Get.width*0.01),
            Text(MyDateUtil.getFormattedTime(context: context, time: widget.message.sent), style: TextStyle(fontSize: Get.height*0.015,color: Colors.grey),),
          ],
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: kIndBlue,
              borderRadius: BorderRadius.all(Radius.circular(Get.width*0.03)),
            ),
            padding: EdgeInsets.symmetric(horizontal:Get.height*0.02,vertical: Get.width*0.02,),
            margin: EdgeInsets.symmetric(horizontal: Get.height*0.02,vertical: Get.width*0.01),
            child: Text(widget.message.msg, style: TextStyle(
              fontSize: Get.height*0.02,
              color: kOxBlue,
            ),),
          ),
        ),
      ],
    );
  }
}
