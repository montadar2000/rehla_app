import 'package:get/get.dart';
import 'package:welcome_screen/controller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }

}