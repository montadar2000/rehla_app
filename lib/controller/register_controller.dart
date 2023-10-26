import 'dart:io';

import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_screen/main.dart';

import '../Model/API/send_data_Api.dart';

class RegisterController extends GetxController{


  String phone='',password='',firstName='',lastName='';


  bool loginPhoneGood=false;
  bool loginPasswordGood=false;
  bool loginFirstNameGood=false;
  bool loginLastNameGood=false;


  int statusCode=0;  int statusCodeOTP=0;

  bool isProgress=false;






  Future<void> Register_send() async {

    await sendDataToAPILocal("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/register", data:{
    "phone":phone,
    "password":password,
    "firstName":firstName,
    "lastName":lastName


    });
  }



sendOtp() async {
  statusCodeOTP=await sendDataToAPI("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/password/resetlink",
      data: {
        "phone":phone
      });
}

  Future<void> sendDataToAPILocal(String apiUrl, {String? authToken, required Map<String, dynamic> data}) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      //print(response.body);
      statusCode=response.statusCode;


    } else {
      print('Failed to send data. Error code: ${response.statusCode}');
      print('Response body: ${response.body}');
      statusCode=response.statusCode;
      print(statusCode);

    }
  }

}