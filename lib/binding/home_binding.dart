import 'package:get/get.dart';
import 'package:welcome_screen/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());

  }

}