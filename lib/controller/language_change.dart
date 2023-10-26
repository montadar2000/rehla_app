import 'dart:async';

import 'package:get/get.dart';
import 'package:welcome_screen/routes/path.dart';

class LanguageChangeController extends GetxController{
  late Timer timer;
  int seconds=1;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {

      if (seconds > 0) {
        seconds--;
        update();
      } else {
        timer.cancel();
        Get.toNamed(AppPath.home);
      }

    });
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
    //Get.toNamed(AppPath.home);
  }
}