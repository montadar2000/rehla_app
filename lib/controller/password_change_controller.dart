import 'dart:convert';

import 'package:get/get.dart';
import 'package:welcome_screen/constant/app_color.dart';

import '../main.dart';
import 'package:http/http.dart' as http;
class PasswordChangeController extends GetxController{
  bool isProgress=false;
  String currentPassword="",newPassword="",confirmPassword="";
  change_password()async{
    isProgress=true;
    update();
    var response=await http.post(Uri.parse("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/$phoneNumber/changePassword"),
        headers:{
          "Authorization":'Bearer $accessUserToken',
          'Content-Type': 'application/json',

        },
        body: jsonEncode({

          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword

        }));
    if(response.statusCode==200){
      Get.snackbar("Success", "Password Changed Successfully",backgroundColor: AppColors.green);
    }
    else{print(jsonDecode(response.body));
      Get.snackbar("Error", jsonDecode(response.body)['data'],backgroundColor: AppColors.appRed);
    }
    isProgress=false;
    update();

  }
}