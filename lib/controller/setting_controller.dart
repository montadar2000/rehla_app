// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/main.dart';
class SettingController extends GetxController{
  bool language=false;//false=arabic and true= English
  bool isProgress=false;
  HomeController homeController=Get.find();

  get_language() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
   language=  preferences.getBool("language")??false;
   update();
    print(language);
  }


  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }
  Future<void> uploadImage() async {
    final pickedFile = await pickImage();
    if (pickedFile == null) {
      // User canceled image selection
      return;
    }

    try {
      final apiUrl = Uri.parse('http://rehla1-873faca9e6cc.herokuapp.com/api/user/profile/${homeController.user.phone}/photo');
      final request = http.MultipartRequest('POST', apiUrl);
      request.headers['Authorization'] = 'Bearer $accessUserToken';
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          pickedFile.path,
          filename: 'image.jpg',
        ),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        homeController.callData();
      } else {
        print('Image upload failed with status code: ${response.statusCode}');
        // Handle the error here, you may want to show a message to the user.
      }
    } catch (e) {
      print('Error uploading image: $e');
      // Handle the error here, you may want to show a message to the user.
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get_language();
  }

}