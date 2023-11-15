import 'package:get/get.dart';

import 'courses_controller.dart';

class DetailsController extends GetxController{
  bool subscribe=true,
      lectList=true;
  int indexClicked=0;
  int examScreenIndex=0;
  CoursesController coursesController=Get.find();
  var list=[];
  var list2=[];

  void allVideo(){
    list=coursesController.availableCourses[coursesController.indexCourseClicked]
        .courseVideos!;
    list2=coursesController.availableCourses[coursesController.indexCourseClicked]
        .exam!;

  }


  @override
  void onInit() {
    // TODO: implement onInit
    allVideo();

    super.onInit();
  }















}

