import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_color.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key, this.width, this.height}) : super(key: key);
final width,height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){print("lock");},
      child: Container(color: AppColors.black.withOpacity(0.4),
          width: width,height: height,
          child: Center(child: Container(
              width: width*0.25,height: height*0.25,
              child: Lottie.asset('assets/lotties/progress.json')))),

    );
  }
}
