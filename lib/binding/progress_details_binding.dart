import 'package:get/get.dart';
import 'package:welcome_screen/controller/progress_controller.dart';

class ProgressBindingDetails extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProgressControllerDetails());
  }

}