import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class OtpController extends GetxController{
  List<String> otpNumber=['','','','','',''];
bool isProgress=false;
int stausCode=0;

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
}