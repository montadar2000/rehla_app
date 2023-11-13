import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/privact_controller.dart';
import 'package:welcome_screen/main.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class PrivacyScreen extends GetView<PrivacyController> {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: SingleChildScrollView(
              child: Container(width: width,height: height,
                padding: EdgeInsets.only(
                    top: 10, bottom: height * 0.05, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Text(
                                language?"Settings":"الاعدادات",
                                style: GoogleFonts.readexPro(fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      language?"Privacy":"سياسة الخصوصية",
                      style: GoogleFonts.readexPro(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    GetBuilder<PrivacyController>(
                        builder: (controller) => Text(
                              controller.privacyText,
                              style: GoogleFonts.readexPro(fontSize: 15),
                            ))
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<PrivacyController>(builder: (controller) {
            print("update");
            return controller.isProgress
                ? Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: ProgressDialog(
                  width: width,
                  height: height,
                ))
                : Container();
          }),
        ],
      ),
    );
  }
}
