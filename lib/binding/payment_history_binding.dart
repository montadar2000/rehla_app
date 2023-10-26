import 'package:get/get.dart';
import 'package:welcome_screen/controller/payment_history_controller.dart';

class PaymentHistoryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PaymentHistoryController());
  }

}