
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/main.dart';

class ExamController extends GetxController{
  HomeController homeController=Get.find();
bool wrongFile=false;
String? filePath;
bool uploadStatus=false;
bool isProgress=false;
int examId=0;


Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom, // Specify the file type here
    allowedExtensions: ['pdf', 'doc', 'docx'], // List of allowed extensions
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    // Check the file size (in bytes) against the maximum limit (10MB = 10 * 1024 * 1024 bytes)
    if (file.size! > 10 * 1024 * 1024) {
      wrongFile=true;
      update();

      // File size exceeds the maximum limit
      return null;// Return null to indicate that the file should not be processed/uploaded
    } else {
      wrongFile=false;
      update();
      return file.path; // Return the file path if the file size is within the limit


    }
  } else {
    wrongFile=true;
    update();

    // User canceled the picker
    return null;

  }
}


 handleFileUpload() async {
  filePath = await pickFile();
  if (filePath != null) {
    print("uploaded successfully");
  }
}
  Future<void> uploadFile() async {
    var uri = Uri.parse('https://rehla1-873faca9e6cc.herokuapp.com/api/exam/student/join'); // Replace with your API endpoint

    var request = http.MultipartRequest('POST', uri);
    if(filePath==null) {
      uploadStatus=false;
      return;
    }
    print(filePath);
    File file=File(filePath!);
    print(file.existsSync());
    var multipartFile = await http.MultipartFile.fromPath('file', filePath!);
    request.headers['Authorization'] = 'Bearer $accessUserToken';
    request.fields['userId'] = homeController.user.id.toString();
    request.fields['examsId'] = examId.toString();
    request.files.add(multipartFile);

print("test");
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        uploadStatus=true;
      } else {
        print('Failed to upload file: ${response.statusCode}');

        uploadStatus=false;
      }
    } catch (e) {
      print('Error uploading file: $e');
      uploadStatus=false;
    }
  }





}