import 'package:get/get.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/controller/progress.dart';

import '../main.dart';
class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
class DegreeInfo {
  DegreeInfo(this.note, this.name, this.date, this.degree);

  final String note;
  final String name;
  final String date;
  final double degree;
}
class ProgressControllerDetails extends GetxController{
  ProgressScreenController progressScreenController =Get.find();
  HomeController homeController=Get.find();

  List<SalesData> data = [];
  List <DegreeInfo>examsList=[];
  fillExamsInfo(){
    for(int i=0;i<progressScreenController.data.length;i++){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(progressScreenController.data[i].createdAt * 1000);
      examsList.add(DegreeInfo(progressScreenController.data[i].note, progressScreenController.data[i].examName,
          "${dateTime.toString().split(" ")[0]}", progressScreenController.data[i].degree));
       data.add(SalesData(language?"Exam $i":"الامتحان $i", progressScreenController.data[i].degree));
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    fillExamsInfo();
    super.onInit();
  }
}