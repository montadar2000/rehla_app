import 'package:get/get.dart';
import 'package:welcome_screen/Model/API/send_data_Api.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/main.dart';

import '../constant/app_color.dart';

class ContactUsController extends GetxController{
HomeController homeController=Get.find();
String message="";
String fullName="";
String phoneNumber="";
bool isProgress=false;
assign_variable(){
  fullName=homeController.user.firstName+" "+homeController.user.lastName;
  phoneNumber=homeController.user.phone;
}

send_message() async {

  try {
    var status = await sendDataToAPI("https://rehla1-873faca9e6cc.herokuapp.com/api/v1/contact",authToken: accessUserToken,
        data: {
          "fullName":fullName,
          "phoneNumber":phoneNumber,
          "message":message
        });
    print(status);

    // Check if the request was successful (status code 200)
    if(status==200){


      return status;
    }
    else
    {
      isProgress=false;
      update();


      return status;

    }
  } catch (e) {
    isProgress=false;
    update();

    // Handle any exceptions that may occur during the request or timeout

    return -1;

  }


}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    assign_variable();
  }
}