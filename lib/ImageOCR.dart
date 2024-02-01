import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class DoctorImageOCR extends StatefulWidget {
  @override
  _DoctorImageOCRState createState() => _DoctorImageOCRState();
}

class _DoctorImageOCRState extends State<DoctorImageOCR> {
  final ImagePicker _picker = ImagePicker();
  File? image1;
  File? image2;

  Future<void> _pickImage(int imageNumber) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          image1 = File(pickedFile.path);
        } else if (imageNumber == 2) {
          image2 = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _uploadImages() async {


    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:5000/extract_text'),
    );

    request.files.add(await http.MultipartFile.fromPath('image1', image1!.path));


    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        // Handle success
        print(await response.stream.bytesToString());
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Similarity Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image1 != null
                ? Image.file(
              image1!,
              height: 100,
            )
                : Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 100,
            ),
            ElevatedButton(
              onPressed: () => _pickImage(1),
              child: Text('Select Image 1'),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImages,
              child: Text('Analyze Report'),
            ),
          ],
        ),
      ),
    );
  }
}
