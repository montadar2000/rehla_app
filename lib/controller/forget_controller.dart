import 'package:get/get.dart';

import '../Model/API/send_data_Api.dart';

class ForgetController extends GetxController{
  String phoneFiled='';
  bool loginPhoneGood=false,isProgress=false;
  int statusCode=0;
  forgetPassword() async {
    statusCode=await sendDataToAPI("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/password/resetlink",
    data: {
      "phone":phoneFiled
    });
  }

}