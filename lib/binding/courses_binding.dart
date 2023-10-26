import 'package:get/get.dart';
import 'package:welcome_screen/controller/courses_controller.dart';

class CoursesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CoursesController(),permanent: true);
  }

}