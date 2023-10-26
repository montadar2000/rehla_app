import 'package:get/get.dart';
import 'package:welcome_screen/controller/material_dtail_controller.dart';

class MaterialDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MaterialDetailController());
  }

}