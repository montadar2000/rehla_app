import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:welcome_screen/main.dart';

import '../constant/app_color.dart';
class PrivacyController extends GetxController{
  String apiUrl ="https://rehla1-873faca9e6cc.herokuapp.com/api/v1/privacy";
  String privacyText='';
  bool isProgress=false;

 get_privay() async {
   try {
     isProgress=true;
     update();
     final response = await http.get(Uri.parse(apiUrl), headers: {
       'Authorization': 'Bearer $accessUserToken',
     }
     ).timeout(Duration(seconds: 10)); // Set your desired timeout duration in seconds

     // Check if the request was successful (status code 200)
     if(response.statusCode==200){
       print(response.body);
       privacyText=response.body;
       isProgress=false;
       update();
       return response.statusCode;
     }
     else
     {
       isProgress=false;
       update();

       Get.snackbar(language?"No Internet":"لايتوفر اتصال بالانترنت", language?"Click here to try again !":
       "اضغط هنا لاعادة المحاولة",
         isDismissible: false,
         backgroundColor: AppColors.appRed,
         onTap: (v){
           get_privay();
           Get.back();
         },
         snackPosition: SnackPosition.TOP,
         duration: null,
       );
     }
   } catch (e) {
     isProgress=false;
     update();

     // Handle any exceptions that may occur during the request or timeout
     Get.snackbar(language?"No Internet":"لايتوفر اتصال بالانترنت", language?"Click here to try again !":
     "اضغط هنا لاعادة المحاولة",
       isDismissible: false,
       backgroundColor: AppColors.appRed,
       onTap: (v){
         get_privay();
         Get.back();
       },
       snackPosition: SnackPosition.TOP,
       duration: null,
     );


   }







 }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get_privay();
  }
}