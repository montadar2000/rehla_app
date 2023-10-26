import 'package:get/get.dart';
import 'package:welcome_screen/controller/language_change.dart';

class LanguageChangeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LanguageChangeController());
  }

}