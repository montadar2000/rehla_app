import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_screen/Model/API/send_data_Api.dart';
import 'package:welcome_screen/controller/courses_controller.dart';
import 'package:welcome_screen/controller/material_controller.dart';
import 'package:welcome_screen/controller/progress.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';
import '../Model/userModel.dart';
import '../constant/app_color.dart';
class FetchResult {
  final int? statusCode;


  final Map<String, dynamic>? data;

  FetchResult({this.statusCode, this.data});
}


class HomeController extends GetxController{


  CoursesController coursesController=Get.find();
  MaterialController materialController =Get.find();


  int homeStatus=0;
  bool isProgress=false;
UserModel user =UserModel(id: 0, phone: '', username: '', firstName: '', lastName: '', photo: '', active: true);
String platform='' ,deviceId='',deviceType='',notificationToken='';
late Map<String, dynamic>  jsonMap;
  Future<FetchResult> fetchDataWithToken(String apiUrl, String accessToken) async {




      try {
        if(coursesController.internetIssue||materialController.internetIssue){
          throw Exception("Skipping the try block and going to catch.");
        }
        final response = await http.get(
          Uri.parse(apiUrl),
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ).timeout(Duration(
            seconds: 10)); // Set your desired timeout duration in seconds

        // Check if the request was successful (status code 200)
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = await json.decode(
              utf8.decode(response.bodyBytes));
          print("${jsonMap['firstName']} test");
          return FetchResult(data: jsonMap);
        }
        else {
          print(response.statusCode);

          return FetchResult(statusCode: response.statusCode);
        }
      } catch (e) {
        // Handle any exceptions that may occur during the request or timeout
        print('Request failed with error: $e');

        return FetchResult(statusCode: -1, data: null);

    }




  }
  bool networkStatus=false;
// void  isInternetAvailable() async {
//     final connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       networkStatus=true;
//       print("network available");
//     } else {
//       networkStatus=false;
//       print("network not available");
//
//     }
//   }

  void callData() async {
    print("join");
    SharedPreferences preferences=await SharedPreferences.getInstance();
    isProgress=true;
    FetchResult result = await fetchDataWithToken("https://rehla1-873faca9e6cc.herokuapp.com/api/user/getUserInfo/${preferences.getString("phoneNumber")}", preferences.getString("accessToken")!);

    if (result.data != null) {
     user= UserModel.fromJson(result.data!);
     if(!user.active){
       Get.snackbar(language?"Error":"خطأ", language?"The User is not Active":"المستخدم غير مفعل",backgroundColor: AppColors.appRed);
       Get.offAllNamed(AppPath.login);
     }

     update();


    } else if (result.statusCode != null) {
      print('Failed to fetch data. Error code: ${result.statusCode}');
      if(result.statusCode==401){
        Get.offAllNamed(AppPath.login);
      }
      else{

          Get.snackbar(language?"No Internet":"لايتوفر اتصال بالانترنت", language?"Click here to try again !":
          "اضغط هنا لاعادة المحاولة",
            isDismissible: false,
            backgroundColor: AppColors.appRed,
            onTap: (v) async {

            await coursesController.fetchDataFromAPI();
            await materialController.callData();
           // progressScreenController.callData();
              callData();
              Get.back();
            },
            snackPosition: SnackPosition.TOP,
            duration: null,
          );


      }





    }
    isProgress=false;

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

    notificationToken='dftyujnbfrtyujht567890';
  }
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    callData();
    getDeviceInfo();



  }
Future<int> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 int statusCode= await sendDataToAPI("https://rehla1-873faca9e6cc.herokuapp.com/api/user/logout", data: {
    'deviceInfo':{
      'deviceId':deviceId,
      'deviceType':deviceType,
      'notificationToken':notificationToken
    }
  },authToken: prefs.getString('accessToken'));
 if(statusCode==200){
  prefs.remove('accessToken');
  prefs.remove('phoneNumber');
  print("logout successfully");
  int num=statusCode;
  return num;
 }
 else{
   print("issue on logout");
   return statusCode;

 }
}










  //svg icons for purpole

  String homePurple='''<svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M10.1859 0.210648C10.547 -0.0702159 11.0526 -0.0702159 11.4137 0.210648L20.4137 7.21065C20.6573 7.4001 20.7998 7.69141 20.7998 8V19C20.7998 19.7957 20.4837 20.5587 19.9211 21.1213C19.3585 21.6839 18.5955 22 17.7998 22H3.7998C3.00415 22 2.24109 21.6839 1.67848 21.1213C1.11588 20.5587 0.799805 19.7957 0.799805 19V8C0.799805 7.69141 0.942278 7.4001 1.18586 7.21065L10.1859 0.210648ZM8.7998 20H12.7998V12H8.7998V20ZM14.7998 20V11C14.7998 10.4477 14.3521 10 13.7998 10H7.7998C7.24752 10 6.7998 10.4477 6.7998 11V20H3.7998C3.53459 20 3.28023 19.8946 3.0927 19.7071C2.90516 19.5196 2.7998 19.2652 2.7998 19V8.48908L10.7998 2.26686L18.7998 8.48908V19C18.7998 19.2652 18.6944 19.5196 18.5069 19.7071C18.3194 19.8946 18.065 20 17.7998 20H14.7998Z" fill="#612C8C"/>
</svg>''',bookPurpole ='''<svg width="23" height="20" viewBox="0 0 23 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.399414 1C0.399414 0.447715 0.847129 0 1.39941 0H7.39941C8.7255 0 9.99727 0.526784 10.9349 1.46447C11.1032 1.63275 11.2583 1.81178 11.3994 1.99997C11.5406 1.81178 11.6956 1.63275 11.8639 1.46447C12.8016 0.526784 14.0733 0 15.3994 0H21.3994C21.9517 0 22.3994 0.447715 22.3994 1V16C22.3994 16.5523 21.9517 17 21.3994 17H14.3994C13.869 17 13.3603 17.2107 12.9852 17.5858C12.6101 17.9609 12.3994 18.4696 12.3994 19C12.3994 19.5523 11.9517 20 11.3994 20C10.8471 20 10.3994 19.5523 10.3994 19C10.3994 18.4696 10.1887 17.9609 9.81363 17.5858C9.43856 17.2107 8.92985 17 8.39941 17H1.39941C0.847129 17 0.399414 16.5523 0.399414 16V1ZM10.3994 15.5359C9.79651 15.1878 9.10764 15 8.39941 15H2.39941V2H7.39941C8.19506 2 8.95813 2.31607 9.52073 2.87868C10.0833 3.44129 10.3994 4.20435 10.3994 5V15.5359ZM12.3994 15.5359C13.0023 15.1878 13.6912 15 14.3994 15H20.3994V2H15.3994C14.6038 2 13.8407 2.31607 13.2781 2.87868C12.7155 3.44129 12.3994 4.20435 12.3994 5V15.5359Z" fill="#612C8C"/>
</svg>
''',filePurpole='''<svg width="18" height="22" viewBox="0 0 18 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.87868 0.87868C1.44129 0.31607 2.20435 0 3 0H10C10.2652 0 10.5196 0.105357 10.7071 0.292893L17.7071 7.29289C17.8946 7.48043 18 7.73478 18 8V19C18 19.7957 17.6839 20.5587 17.1213 21.1213C16.5587 21.6839 15.7957 22 15 22H3C2.20435 22 1.44129 21.6839 0.87868 21.1213C0.31607 20.5587 0 19.7957 0 19V3C0 2.20435 0.31607 1.44129 0.87868 0.87868ZM3 2C2.73478 2 2.48043 2.10536 2.29289 2.29289C2.10536 2.48043 2 2.73478 2 3V19C2 19.2652 2.10536 19.5196 2.29289 19.7071C2.48043 19.8946 2.73478 20 3 20H15C15.2652 20 15.5196 19.8946 15.7071 19.7071C15.8946 19.5196 16 19.2652 16 19V8.41421L9.58579 2H3Z" fill="#612C8C"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M10 0C10.5523 0 11 0.447715 11 1V7H17C17.5523 7 18 7.44772 18 8C18 8.55228 17.5523 9 17 9H10C9.44771 9 9 8.55228 9 8V1C9 0.447715 9.44771 0 10 0Z" fill="#202020"/>
</svg>
''',arrowPurpole='''<svg width="25" height="14" viewBox="0 0 25 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.998 2C17.4458 2 16.998 1.55228 16.998 1C16.998 0.447715 17.4458 0 17.998 0H23.998C24.5503 0 24.998 0.447715 24.998 1V7C24.998 7.55228 24.5503 8 23.998 8C23.4458 8 22.998 7.55228 22.998 7V3.41421L15.2052 11.2071C14.8146 11.5976 14.1815 11.5976 13.7909 11.2071L9.49805 6.91421L2.70515 13.7071C2.31463 14.0976 1.68146 14.0976 1.29094 13.7071C0.900416 13.3166 0.900416 12.6834 1.29094 12.2929L8.79094 4.79289C9.18146 4.40237 9.81463 4.40237 10.2052 4.79289L14.498 9.08579L21.5838 2H17.998Z" fill="#612C8C"/>
</svg>
''',personPurpole='''<svg width="18" height="20" viewBox="0 0 18 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M9.00098 2C7.34412 2 6.00098 3.34315 6.00098 5C6.00098 6.65685 7.34412 8 9.00098 8C10.6578 8 12.001 6.65685 12.001 5C12.001 3.34315 10.6578 2 9.00098 2ZM4.00098 5C4.00098 2.23858 6.23955 0 9.00098 0C11.7624 0 14.001 2.23858 14.001 5C14.001 7.76142 11.7624 10 9.00098 10C6.23955 10 4.00098 7.76142 4.00098 5ZM1.46544 13.4645C2.40312 12.5268 3.67489 12 5.00098 12H13.001C14.3271 12 15.5988 12.5268 16.5365 13.4645C17.4742 14.4021 18.001 15.6739 18.001 17V19C18.001 19.5523 17.5533 20 17.001 20C16.4487 20 16.001 19.5523 16.001 19V17C16.001 16.2044 15.6849 15.4413 15.1223 14.8787C14.5597 14.3161 13.7966 14 13.001 14H5.00098C4.20533 14 3.44227 14.3161 2.87966 14.8787C2.31705 15.4413 2.00098 16.2043 2.00098 17V19C2.00098 19.5523 1.55326 20 1.00098 20C0.448692 20 0.000976562 19.5523 0.000976562 19V17C0.000976562 15.6739 0.527761 14.4021 1.46544 13.4645Z" fill="#612C8C"/>
</svg>
''';

  //svg icons for black

  String homeBlack='''<svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M10.1859 0.210648C10.547 -0.0702159 11.0526 -0.0702159 11.4137 0.210648L20.4137 7.21065C20.6573 7.4001 20.7998 7.69141 20.7998 8V19C20.7998 19.7957 20.4837 20.5587 19.9211 21.1213C19.3585 21.6839 18.5955 22 17.7998 22H3.7998C3.00415 22 2.24109 21.6839 1.67848 21.1213C1.11588 20.5587 0.799805 19.7957 0.799805 19V8C0.799805 7.69141 0.942278 7.4001 1.18586 7.21065L10.1859 0.210648ZM8.7998 20H12.7998V12H8.7998V20ZM14.7998 20V11C14.7998 10.4477 14.3521 10 13.7998 10H7.7998C7.24752 10 6.7998 10.4477 6.7998 11V20H3.7998C3.53459 20 3.28023 19.8946 3.0927 19.7071C2.90516 19.5196 2.7998 19.2652 2.7998 19V8.48908L10.7998 2.26686L18.7998 8.48908V19C18.7998 19.2652 18.6944 19.5196 18.5069 19.7071C18.3194 19.8946 18.065 20 17.7998 20H14.7998Z" fill="#202020"/>
</svg>''',bookBlack ='''<svg width="23" height="20" viewBox="0 0 23 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.399414 1C0.399414 0.447715 0.847129 0 1.39941 0H7.39941C8.7255 0 9.99727 0.526784 10.9349 1.46447C11.1032 1.63275 11.2583 1.81178 11.3994 1.99997C11.5406 1.81178 11.6956 1.63275 11.8639 1.46447C12.8016 0.526784 14.0733 0 15.3994 0H21.3994C21.9517 0 22.3994 0.447715 22.3994 1V16C22.3994 16.5523 21.9517 17 21.3994 17H14.3994C13.869 17 13.3603 17.2107 12.9852 17.5858C12.6101 17.9609 12.3994 18.4696 12.3994 19C12.3994 19.5523 11.9517 20 11.3994 20C10.8471 20 10.3994 19.5523 10.3994 19C10.3994 18.4696 10.1887 17.9609 9.81363 17.5858C9.43856 17.2107 8.92985 17 8.39941 17H1.39941C0.847129 17 0.399414 16.5523 0.399414 16V1ZM10.3994 15.5359C9.79651 15.1878 9.10764 15 8.39941 15H2.39941V2H7.39941C8.19506 2 8.95813 2.31607 9.52073 2.87868C10.0833 3.44129 10.3994 4.20435 10.3994 5V15.5359ZM12.3994 15.5359C13.0023 15.1878 13.6912 15 14.3994 15H20.3994V2H15.3994C14.6038 2 13.8407 2.31607 13.2781 2.87868C12.7155 3.44129 12.3994 4.20435 12.3994 5V15.5359Z" fill="#202020"/>
</svg>
''',fileBlack='''<svg width="18" height="22" viewBox="0 0 18 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.87868 0.87868C1.44129 0.31607 2.20435 0 3 0H10C10.2652 0 10.5196 0.105357 10.7071 0.292893L17.7071 7.29289C17.8946 7.48043 18 7.73478 18 8V19C18 19.7957 17.6839 20.5587 17.1213 21.1213C16.5587 21.6839 15.7957 22 15 22H3C2.20435 22 1.44129 21.6839 0.87868 21.1213C0.31607 20.5587 0 19.7957 0 19V3C0 2.20435 0.31607 1.44129 0.87868 0.87868ZM3 2C2.73478 2 2.48043 2.10536 2.29289 2.29289C2.10536 2.48043 2 2.73478 2 3V19C2 19.2652 2.10536 19.5196 2.29289 19.7071C2.48043 19.8946 2.73478 20 3 20H15C15.2652 20 15.5196 19.8946 15.7071 19.7071C15.8946 19.5196 16 19.2652 16 19V8.41421L9.58579 2H3Z" fill="#202020"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M10 0C10.5523 0 11 0.447715 11 1V7H17C17.5523 7 18 7.44772 18 8C18 8.55228 17.5523 9 17 9H10C9.44771 9 9 8.55228 9 8V1C9 0.447715 9.44771 0 10 0Z" fill="#202020"/>
</svg>
''',arrowBlack='''<svg width="25" height="14" viewBox="0 0 25 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.998 2C17.4458 2 16.998 1.55228 16.998 1C16.998 0.447715 17.4458 0 17.998 0H23.998C24.5503 0 24.998 0.447715 24.998 1V7C24.998 7.55228 24.5503 8 23.998 8C23.4458 8 22.998 7.55228 22.998 7V3.41421L15.2052 11.2071C14.8146 11.5976 14.1815 11.5976 13.7909 11.2071L9.49805 6.91421L2.70515 13.7071C2.31463 14.0976 1.68146 14.0976 1.29094 13.7071C0.900416 13.3166 0.900416 12.6834 1.29094 12.2929L8.79094 4.79289C9.18146 4.40237 9.81463 4.40237 10.2052 4.79289L14.498 9.08579L21.5838 2H17.998Z" fill="#202020"/>
</svg>
''',personBlack='''<svg width="18" height="20" viewBox="0 0 18 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M9.00098 2C7.34412 2 6.00098 3.34315 6.00098 5C6.00098 6.65685 7.34412 8 9.00098 8C10.6578 8 12.001 6.65685 12.001 5C12.001 3.34315 10.6578 2 9.00098 2ZM4.00098 5C4.00098 2.23858 6.23955 0 9.00098 0C11.7624 0 14.001 2.23858 14.001 5C14.001 7.76142 11.7624 10 9.00098 10C6.23955 10 4.00098 7.76142 4.00098 5ZM1.46544 13.4645C2.40312 12.5268 3.67489 12 5.00098 12H13.001C14.3271 12 15.5988 12.5268 16.5365 13.4645C17.4742 14.4021 18.001 15.6739 18.001 17V19C18.001 19.5523 17.5533 20 17.001 20C16.4487 20 16.001 19.5523 16.001 19V17C16.001 16.2044 15.6849 15.4413 15.1223 14.8787C14.5597 14.3161 13.7966 14 13.001 14H5.00098C4.20533 14 3.44227 14.3161 2.87966 14.8787C2.31705 15.4413 2.00098 16.2043 2.00098 17V19C2.00098 19.5523 1.55326 20 1.00098 20C0.448692 20 0.000976562 19.5523 0.000976562 19V17C0.000976562 15.6739 0.527761 14.4021 1.46544 13.4645Z" fill="#202020"/>
</svg>
''';
  int selectedIndex=0;

}