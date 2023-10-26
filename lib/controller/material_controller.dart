

import 'dart:convert';

import 'package:get/get.dart';
import 'package:welcome_screen/controller/progress.dart';

import '../Model/material_model.dart';
import '../Model/progressModel.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
class MaterialController extends GetxController{

  bool completeFetched=false;

  List lect=[
    {
      "lect_name":"الفيزياء",
      "mr_name":"الاستاذ: حسن علي",
      "desc":"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص  هذا  ",
      "image":"assets/icons/physics.svg",

    },
    {
      "lect_name":"الفيزياء",
      "mr_name":"الاستاذ: حسن علي",
      "desc":"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص  هذا  ",
      "image":"assets/icons/physics.svg",
    },
    {
      "lect_name":"الفيزياء",
      "mr_name":"الاستاذ: حسن علي",
      "desc":"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص  هذا  ",
      "image":"assets/icons/physics.svg",
    },
    {
      "lect_name":"الفيزياء",
      "mr_name":"الاستاذ: حسن علي",
      "desc":"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص  هذا  ",
      "image":"assets/icons/physics.svg",
    },
  ];

  bool isProgress=false;
  int statusCode=0;
  List<Material> materials=[];
  int indexMaterialClicked=0;
  bool internetIssue=false;

  Future<List<Material>> fetchMaterials() async {
    final Uri uri = Uri.parse('https://rehla1-873faca9e6cc.herokuapp.com/materials'); // Replace with your API endpoint

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

        final List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
        print("material $internetIssue");

        return jsonData.map((item) => Material.fromJson(item)).toList();
      }
      else {

        internetIssue=false;
        print("material $internetIssue");


      }
    }
    catch(e){
      internetIssue=true;

    }

    print("material $internetIssue");
    return [];



  }



  Future<List<ProgressModel>>fetchProgress(int id) async {
    ProgressScreenController progressScreenController = Get.find();

final Uri uri = Uri.parse(
      'https://rehla1-873faca9e6cc.herokuapp.com/api/exam/student/2/examsId/$id'); // Replace with your API endpoint

  try {
    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessUserToken',
      // Replace with your access token
      // Add any custom headers as needed
    };

    final response = await http.get(
      uri,
      headers: headers,
    );
    progressScreenController.statusCode = response.statusCode;
    if (response.statusCode == 200) {
      //print(response.bodyBytes);

      var jsonData1 = json.decode(
          utf8.decode(response.bodyBytes));


      //print(jsonData1);
      print("here");
      return jsonData1.map((item) => ProgressModel.fromJson(item)).toList();
    }
    else {

    }
  }
  catch (e) {


  }
  return [];
}

callData()async {
  materials = await fetchMaterials();


  // ProgressScreenController progressScreenController = Get.find();
  //
  //
  //
  // for (int i = 0; i < materials.length; i++) {
  //
  //   progressScreenController.listIdMaterial.add(materials[i].id);
  // }
  // progressScreenController.update();
  //
  //
  // for (int i = 0; i < progressScreenController.listIdMaterial.length; i++) {
  //   var x= await fetchProgress(i);
  //   progressScreenController.listProgress.add(x);
  //   print(progressScreenController.listProgress[i]);
  // }



}
  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
    callData();
  }
}