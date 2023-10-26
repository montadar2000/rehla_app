import 'package:get/get.dart';
import 'package:welcome_screen/Model/progressModel.dart';
import 'package:welcome_screen/controller/material_controller.dart';

class ProgressScreenController extends GetxController{
  MaterialController materialController=Get.find();
  List<int> listIdMaterial=[];
  bool internetIssue=false;
  int statusCode=0;
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

List <List<ProgressModel>> listProgress=[];


  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
}