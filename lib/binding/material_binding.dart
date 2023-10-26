import 'package:get/get.dart';
import 'package:welcome_screen/controller/material_controller.dart';

class MaterialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MaterialController());
  }

}