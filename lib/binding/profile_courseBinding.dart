import 'package:get/get.dart';
import 'package:welcome_screen/controller/profile_courseController.dart';

class ProfileCourseBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ProfileCourseController());
  }
}