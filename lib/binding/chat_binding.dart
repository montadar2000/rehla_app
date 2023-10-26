import 'package:get/get.dart';
import 'package:welcome_screen/controller/chat_controller.dart';

class ChatBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ChatController());
  }

}