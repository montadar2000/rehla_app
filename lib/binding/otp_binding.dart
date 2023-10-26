import 'package:get/get.dart';
import 'package:welcome_screen/controller/otp_controller.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OtpController());
  }

}