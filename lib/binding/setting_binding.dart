import 'package:get/get.dart';
import 'package:welcome_screen/controller/setting_controller.dart';

class Settingbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SettingController());
  }

}