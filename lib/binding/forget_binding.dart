import 'package:get/get.dart';
import 'package:welcome_screen/controller/forget_controller.dart';

class ForgetBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ForgetController());
  }

}