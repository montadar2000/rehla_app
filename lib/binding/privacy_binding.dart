import 'package:get/get.dart';
import 'package:welcome_screen/controller/privact_controller.dart';

class PrivacyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PrivacyController());
  }

}