import 'package:get/get.dart';
import 'package:welcome_screen/controller/start_controller.dart';

class StartVideoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(StartVideoController());

  }

}