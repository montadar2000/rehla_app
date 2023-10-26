import 'package:get/get.dart';
import 'package:welcome_screen/controller/list_cross_game_level_controller.dart';

class ListCrossGameLevelBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ListCrossGameLeveController());
  }

}