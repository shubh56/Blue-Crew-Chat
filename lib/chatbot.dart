import 'dart:convert';

import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String textResponse = 'Response for answer';
  final TextEditingController _questionController = TextEditingController();
  var _answer;
  Future<void> _askQuestion(text) async {



    String originalString = _questionController.text;
    String encodedString = Uri.encodeQueryComponent(originalString);
    print(encodedString);  // Output: What+is+the+patient%27s+name%3F


    print('In the ask question');
    final String question = encodedString;
    if (question.isEmpty) {
      print('Question is empty');
      return;
    }

    // Replace 'your-flask-api-url' with your actual Flask API URL
    final String apiUrl = 'https://4858-203-212-24-36.ngrok-free.app/ask?question=$question';

    try {
      print('In the try block');
      final response = await http.get(Uri.parse(apiUrl));
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Parse the response and update the answer
        setState(() {
          Map<String, dynamic> _answer = json.decode(response.body);
          textResponse=_answer['answer'];
        });
      } else {
        // Handle non-200 status code
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    }
  }

  TextEditingController text = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    buildShowDialog(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    }

    return Scaffold(
      backgroundColor: kOxBlue,
        body: SingleChildScrollView(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Container(
            margin: EdgeInsets.only(right: Get.width*0.3,top: Get.height*0.04, left: Get.width*0.06),
            height: Get.height*0.08,
            width: Get.width*0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(32.0), topRight: Radius.circular(32.0), bottomRight: Radius.circular(32.0)),
              gradient:LinearGradient(colors: [
                Colors.blue.shade900,
                Colors.blue.shade800,
                Colors.blue.shade700,
                Colors.blue.shade600,
                Colors.blue.shade500,
              ]),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hii, I am MeddiBuddy, how can I help you today?',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: Get.height*0.02,
                    color: kSeaSalt,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Center(
            child: Container(
              height: Get.height*0.1,
              width: Get.width*0.8,
              child: TextField(
                controller: _questionController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kSeaSalt,
                  hintText: 'Ask a question to the MeddiBuddy',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(32.0), topRight: Radius.circular(32.0), bottomLeft: Radius.circular(32.0) ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Container(
            margin: EdgeInsets.only(right: Get.height*0.08,),
            height: Get.height*0.25,
            width: Get.width*0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(32.0), topRight: Radius.circular(32.0), bottomRight: Radius.circular(32.0)),
              gradient:LinearGradient(colors: [
              Colors.blue.shade900,
              Colors.blue.shade800,
              Colors.blue.shade700,
              Colors.blue.shade600,
              Colors.blue.shade500,
            ]),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    textResponse,
                    style: TextStyle(
                      fontSize: Get.height*0.02,
                      color: kSeaSalt,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.2,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kSeaSalt),
              foregroundColor: MaterialStatePropertyAll(kOxBlue),
            ),
            onPressed: () {
              _askQuestion(text.text).then((value) => Get.back());
              buildShowDialog(context);
            },
            child: Text(
              'Answer Question',
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: Get.height*0.02,
              ),
            ),
          ),


      ],
    ),
        ),
    );
  }
}
