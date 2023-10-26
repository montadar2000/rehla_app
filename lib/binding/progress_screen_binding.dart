import 'package:get/get.dart';

import '../controller/progress.dart';

class ProgressScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProgressScreenController());
  }

}