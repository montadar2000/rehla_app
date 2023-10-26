import 'package:get/get.dart';
import 'package:welcome_screen/controller/exam_controller.dart';

class ExamBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ExamController());
  }

}