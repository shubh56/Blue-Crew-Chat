import 'dart:convert';
import 'dart:io';

import 'package:blue_crew_chat/Widgets/message_card.dart';
import 'package:blue_crew_chat/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chat-user.dart';
import '../models/message.dart';
import 'Auth/authentication.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> list = [];
  final textController = TextEditingController();
  bool showEmpoji = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: (){
            if(showEmpoji){
              setState(() {
                showEmpoji = showEmpoji;
              });
              return Future.value(false);
            }
            else{
              return Future.value(true);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kOxBlue,
              automaticallyImplyLeading: false,
              flexibleSpace: _appBar(),
            ),
            body: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                      stream: Auth.getAllMessages(widget.user),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const Center(child: CircularProgressIndicator());
                          case ConnectionState.active:
                          case ConnectionState.done:
                            final data = snapshot.data?.docs;
                            print('Data: ${jsonEncode(data![0].data())}');
                            list = data
                                    .map((e) => Message.fromJson(e.data()))
                                    .toList() ??
                                [];

                            if (list.isNotEmpty) {
                              return ListView.builder(
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.01,
                                ),
                                itemCount: list.length,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return MessageCard(
                                    message: list[index],
                                  );
                                },
                              );
                            } else {
                              //TODO: Beatuify THIS
                              return Center(
                                child: Text(
                                  'Say Hii!! 👋',
                                ),
                              );
                            }
                        }
                      }),
                ),
                _chatInput(),
                if(showEmpoji)
                  SizedBox(
                    height: Get.height*0.35,
                    child: EmojiPicker(
                      textEditingController: textController,
                      config: Config(
                        bgColor: kSeaSalt,
                        columns: 7,
                        emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chatInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.height * 0.015,
        vertical: Get.width * 0.02,
      ),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Get.height * 0.03,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          onTap: () => FocusScope.of(context).unfocus();
                          showEmpoji = !showEmpoji;
                        });
                      },
                      icon: const Icon(Icons.emoji_emotions, color: kIndBlue)),
                  Expanded(
                    child: TextField(
                        onTap: (){
                          if(showEmpoji){
                            setState(() {
                              showEmpoji = !showEmpoji;
                            });
                          }
                        },
                        controller: textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Send a message',
                          hintStyle: TextStyle(
                            color: kIndBlue,
                          ),
                          border: InputBorder.none,
                        )),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo, color: kIndBlue)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_rounded,
                          color: kIndBlue)),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                Auth.sendMessage(widget.user, textController.text);
                textController.text = '';
              }
            },
            shape: CircleBorder(),
            color: kOxBlue,
            padding: EdgeInsets.all(Get.height * 0.01),
            minWidth: 0,
            child: Icon(
              Icons.send,
              size: Get.height * 0.03,
              color: kIndBlue,
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Get.toNamed('/HomeScreen');
              },
              icon: Icon(Icons.arrow_back, color: kSeaSalt)),
          ClipRRect(
            borderRadius: BorderRadius.circular(Get.height * 0.2),
            child: CachedNetworkImage(
              width: Get.height * 0.04,
              height: Get.height * 0.04,
              imageUrl: widget.user.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name,
                style: TextStyle(
                  color: kSeaSalt,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.height * 0.02,
                ),
              ),
              Text(
                'Last seen not available',
                style: TextStyle(
                  color: kSeaSalt,
                  fontSize: Get.height * 0.017,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
