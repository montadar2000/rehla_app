import 'package:get/get.dart';
import 'package:welcome_screen/controller/exam_status_controller.dart';

class ExamStatusBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ExamStatusController());
}
}