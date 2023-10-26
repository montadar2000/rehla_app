import 'package:get/get.dart';
import 'package:welcome_screen/controller/password_change_controller.dart';

class PassowrdChangeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PasswordChangeController());
  }

}