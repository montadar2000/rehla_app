import 'dart:convert';

import 'package:get/get.dart';
import 'package:welcome_screen/Model/progressModel.dart';
import 'package:welcome_screen/controller/courses_controller.dart';
import 'package:http/http.dart' as http;
import 'package:welcome_screen/controller/home_controller.dart';
import '../main.dart';

class ProgressScreenController extends GetxController{
  CoursesController coursesController=Get.find();
  HomeController homeController=Get.put(HomeController());
  List<int> listIdMaterial=[];
  bool internetIssue=false;
  int statusCode=0;
  var data = <ExamData>[];
  var progress = "";
  bool isProgress=false;


  Future<List<ProgressModel>> fetchProgress() async {
    final Uri uri = Uri.parse('https://rehla1-873faca9e6cc.herokuapp.com/api/exam/student/${homeController.user.id}/courses/${coursesController.idExamClickedForProgress}');

    try{
      final Map<String, String> headers = {
        'Authorization': 'Bearer $accessUserToken', // Replace with your access token
        // Add any custom headers as needed
      };

      final response = await http.get(
        uri,
        headers: headers,
      );
      statusCode=response.statusCode;
      if (response.statusCode == 200) {
        internetIssue=false;

        final responseJson = json.decode(utf8.decode(response.bodyBytes));

        responseJson['progress']=responseJson['progress'].toString();
          print(responseJson['progress']);

        final examResponse = ProgressModel.fromJson(responseJson);

        print("test2");

        data.assignAll(examResponse.data);
        progress = examResponse.progress.toString();
        print(progress);
        if(progress=="NaN"){
          progress='0.0';
        }else
          {
            var x=double.parse(progress);
            x=(x * 1000).round() / 1000;
            progress=x.toString();

          }

        print(data.length);
      }
      else {

        internetIssue=false;
        print("progress $internetIssue");


      }
    }
    catch(e){
      internetIssue=true;
      print("progress $internetIssue");
      print(e);
      print("catch");

    }

    return[];



  }


  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
}