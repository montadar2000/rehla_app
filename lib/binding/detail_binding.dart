import 'package:get/get.dart';
import 'package:welcome_screen/controller/details_contriller.dart';

class DetailsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DetailsController());
  }

}