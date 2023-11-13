import 'package:get/get.dart';

import 'courses_controller.dart';

class DetailsController extends GetxController{
  bool subscribe=true,
      lectList=true;
  List chemistryLectures=[
    {
      "video_url":"",
      "file_url":"https://africau.edu/images/default/sample.pdf",
      "text":"المحاضرة رقم 1",

    },
    {
      "video_url":"",
      "file_url":"http://debracollege.dspaces.org/bitstream/123456789/64/1/Analysis%20of%20Algorithms%20-%20An%20Active%20Learning%20Approach%20by%20Jeffrey%20J.%20McConnell.pdf",
      "text":"المحاضرة رقم 2",

    },
    {
      "video_url":"",
      "file_url":"https://ceng383.cankaya.edu.tr/uploads/files/lecture_02.pdf",
      "text":"المحاضرة رقم 3",

    },
    {
      "video_url":"d",
      "file_url":"",
      "text":"المحاضرة رقم 4",

    },
    {
      "video_url":"",
      "file_url":"",
      "text":"المحاضرة رقم 5",

    },
    {
      "video_url":"",
      "file_url":"",
      "text":"المحاضرة رقم 6",

    }
  ];
  List chemistryExams=[
    {
      "file_url":"",
      "text":"عنوان الامتحان 1",
    },    {
      "file_url":"",
      "text":"عنوان الامتحان 2",
    },    {
      "file_url":"",
      "text":"عنوان الامتحان 3",
    },    {
      "file_url":"",
      "text":"عنوان الامتحان 4",
    },    {
      "file_url":"",
      "text":"عنوان الامتحان 5",
    },

  ];
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

