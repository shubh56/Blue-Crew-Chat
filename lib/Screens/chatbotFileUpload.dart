import 'dart:convert';

import 'package:blue_crew_chat/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatBotFileUpload extends StatefulWidget {
  const ChatBotFileUpload({super.key});

  @override
  State<ChatBotFileUpload> createState() => _ChatBotFileUploadState();
}

class _ChatBotFileUploadState extends State<ChatBotFileUpload> {

  PlatformFile? pickedFile;
  String? containerText;
  String? filePath;

  Future<void> pickFile() async {
    print('In pick file');
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf']);
    setState(() {
      pickedFile = result?.files.first;
      containerText = result?.files.first.name;
      filePath=pickedFile!.path!;
      print(filePath);
    });

  }

   Future<void> _uploadFile() async{
      if(pickedFile == null){
        print('no file found');
      }
      var uri = Uri.parse('');
      var request = http.MultipartRequest('POST', uri);
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          pickedFile!.bytes!,
          filename: pickedFile!.name,
        ),
      );
      var response = await request.send();

      if (response.statusCode == 200) {
            print('File uploaded successfully');
            // Handle the server response if needed
          } else {
            print('Failed to upload file. Status Code: ${response.statusCode}');
          }

   }


  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOxBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: pickFile, child: Text('Pick Report File'),)),
          SizedBox(
            height: Get.height * 0.1,
          ),
          TextButton(onPressed: (){ Get.toNamed('/ChatBot');}, child: Text('Next Page'),),
        ],
      ),
    );
  }
}
