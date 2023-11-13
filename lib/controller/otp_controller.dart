import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/routes/path.dart';

import '../main.dart';

class OtpController extends GetxController{
  List<String> otpNumber=['','','','','',''];
bool isProgress=false;
int stausCode=0;
String newPassword="",confirmPassword="";

  int convertOtpTONumber(){
    for(int i=0;i<otpNumber.length;i++){
      if(otpNumber[i]==''){
        return 0;
      }}
      for (String item in otpNumber) {
        if (int.tryParse(item) == null) {
          return 0;
        }
      }
      String temp='';
      for (int i=0;i<otpNumber.length;i++){
        temp=temp+otpNumber[i];
      }
      return int.parse(temp);


    }



late Timer timer;
int seconds=120;
void startTimer() {
  timer = Timer.periodic(Duration(seconds: 1), (t) {

    if (seconds > 0) {
      seconds--;
      update();
    } else {
      timer.cancel();
    }

  });
}
@override
  void onInit() {
    // TODO: implement onInit
  startTimer();
  print(Get.previousRoute);

  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    timer.cancel();
  }
   Future<Map<String, dynamic>> verification(phone)async{

  var response = await http.get(Uri.parse("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/registrationConfirmation/?otp=${convertOtpTONumber()}&phone=$phone"));
  if(response.statusCode==200){
    stausCode=response.statusCode;
    return jsonDecode(response.body);
  }
  else{
    stausCode=response.statusCode;

    return jsonDecode(response.body);
  }
  }
  change_password(phone)async{
    isProgress=true;
    update();
    var response=await http.post(Uri.parse("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/$phone/password/reset"),
        headers:{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({

          "password": newPassword,
          "confirmPassword": confirmPassword,
          "token":convertOtpTONumber().toString()


        }));
    if(response.statusCode==200){
      Get.snackbar(language?"Success":"نجح", language?"Password Changed Successfully":"تم تغيير كلمة السر بنجاح",backgroundColor: AppColors.green);
      Get.offAllNamed(AppPath.login);
    }
    else{
      print(jsonDecode(response.body));
    Get.snackbar(language?"Error":"خطأ", jsonDecode(response.body)['data'],backgroundColor: AppColors.appRed);
    }
    isProgress=false;
    update();

  }

}