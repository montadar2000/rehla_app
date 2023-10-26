import 'package:get/get.dart';
import 'package:welcome_screen/controller/contact_us_controller.dart';

class ContacUsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ContactUsController());
  }

}