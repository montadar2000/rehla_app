import 'package:get/get.dart';
import 'package:welcome_screen/controller/game_controller.dart';

class GameBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(GameController());
  }

}