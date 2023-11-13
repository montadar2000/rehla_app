import 'dart:io';

import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_screen/main.dart';

class LoginController extends GetxController{


  String phone='',password='';
  String platform='' ,deviceId='',deviceType='',notificationToken='';
  bool loginPhoneGood=false;
  bool loginPasswordGood=false;
  int statusCode=0;
  bool isProgress=false;




  @override
  void onInit() {
    // TODO: implement onInit
    getDeviceInfo();

  }
  Future<void> getDeviceInfo() async {
    platform = Platform.isAndroid ? 'Android' : 'iOS';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if(platform=='Android'){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId=androidInfo.id!;
      deviceType="DEVICE_TYPE_ANDROID";
      print('Running on ${androidInfo.id}');
    }
    else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId=iosInfo.identifierForVendor!;
      deviceType="DEVICE_TYPE_IOS";
      print('Running on ${iosInfo.identifierForVendor}');
    }

    notificationToken='notificationTokenNotUsedYet';
  }
  Future<void> Login_send() async {
print(phone);
print(password);
print(deviceId);

print(deviceType);
print(notificationToken);


     await sendDataToAPI("https://rehla1-873faca9e6cc.herokuapp.com/api/auth/login", data: {
      "phone":phone,
      "password":password,
      "deviceInfo":{
        "deviceId":deviceId,
        "deviceType":deviceType,
        "notificationToken":notificationToken

      }
    });
  }





  Future<Object> sendDataToAPI(String apiUrl, {String? authToken, required Map<String, dynamic> data}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
      prefs.setString("accessToken",jsonDecode(response.body)['accessToken']);
      print(jsonDecode(response.body)['accessToken']);
      prefs.setString("phoneNumber",phone);
      accessUserToken=jsonDecode(response.body)['accessToken'];
      phoneNumber=phone;


      return response;
    } else {
      print('Failed to send data. Error code: ${response.statusCode}');
      print('Response body: ${response.body}');
      statusCode=response.statusCode;
      return response.statusCode;
    }
  }

}