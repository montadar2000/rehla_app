import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/controller/setting_controller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/pages.dart';
import 'package:welcome_screen/routes/path.dart';
import 'dart:developer' as developer;

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class SettingScreen extends GetView<SettingController> {
  SettingScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              bottom: false,
              right: false,
              left: false,
              child: Container(
                width: width,
                height: height,
                padding: EdgeInsets.all(20),
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
                                language?"my profile":"ملفي الشخصي",
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
                    Stack(
                      children: [
                        GetBuilder<HomeController>(
                          builder: (controller) => Builder(builder: (_) {
                            if (homeController.user.photo != "") {
                              return CircleAvatar(
                                  radius: 70,
                                  backgroundColor: AppColors.white,
                                  backgroundImage:
                                      NetworkImage(homeController.user.photo));
                            } else {
                              return CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  radius: 70,
                                  backgroundImage: AssetImage(
                                      "assets/images/user_image.png"));
                            }
                          }),
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              print("change picture");
                              controller.isProgress = true;
                              controller.update();
                              await controller.uploadImage();
                              controller.isProgress = false;
                              controller.update();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: AppColors.appLightGrey),
                                child: SvgPicture.asset(
                                  "assets/icons/edit_pic.svg",
                                  width: 40,
                                )),
                          ),
                          right: 10,
                          bottom: 0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "${homeController.user.firstName} ${homeController.user.lastName}",
                      style: GoogleFonts.readexPro(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    GestureDetector(
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                          children: language?[SvgPicture.asset(
                            "assets/icons/lock.svg",
                            width: 25,
                            height: 25,
                            color: AppColors.black,
                          ),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "change password",
                              style: GoogleFonts.readexPro(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ]:[
                            Text(
                              "تغيير كلمة المرور",
                              style: GoogleFonts.readexPro(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/lock.svg",
                              width: 25,
                              height: 25,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        print("password change");
                        Get.toNamed(AppPath.passwordChange);
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,

                      children: [
                        Text(
                          "Arabic  ",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        GetBuilder<SettingController>(
                          builder: (controller) => CupertinoSwitch(
                              value: controller.language,
                              onChanged: (v) async {
                                controller.language = v;
                                controller.update();
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.setBool("language", v);
                                language=v;
                                Get.offAllNamed(AppPath.languageChange);


                              }),
                        ),
                        Text(
                          "  English",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    // GestureDetector(
                    //   child: Container(
                    //     width: width,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                    //       children: language?[
                    //         SvgPicture.asset(
                    //           "assets/icons/dollar.svg",
                    //           width: 25,
                    //           height: 25,
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           "payment history",
                    //           style: GoogleFonts.readexPro(
                    //               fontSize: 20, fontWeight: FontWeight.w500),
                    //         ),
                    //       ]:[
                    //         Text(
                    //           "عرض تاريخ الدفع",
                    //           style: GoogleFonts.readexPro(
                    //               fontSize: 20, fontWeight: FontWeight.w500),
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         SvgPicture.asset(
                    //           "assets/icons/dollar.svg",
                    //           width: 25,
                    //           height: 25,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     print("payment history");
                    //     Get.toNamed(AppPath.paymentHistory);
                    //   },
                    // ),
                    // SizedBox(
                    //   height: height * 0.04,
                    // ),
                    // GestureDetector(
                    //   child: Container(
                    //     width: width,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                    //       children:language?[SvgPicture.asset(
                    //         "assets/icons/wallet.svg",
                    //         width: 25,
                    //         height: 25,
                    //       ),
                    //
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           "my wallet",
                    //           style: GoogleFonts.readexPro(
                    //               fontSize: 20, fontWeight: FontWeight.w500),
                    //         ),
                    //       ]: [
                    //         Text(
                    //           "محفظي",
                    //           style: GoogleFonts.readexPro(
                    //               fontSize: 20, fontWeight: FontWeight.w500),
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         SvgPicture.asset(
                    //           "assets/icons/wallet.svg",
                    //           width: 25,
                    //           height: 25,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     print("my wallet");
                    //   },
                    // ),
                    // SizedBox(
                    //   height: height * 0.04,
                    // ),
                    GestureDetector(
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                          children:language?[ SvgPicture.asset(
                            'assets/icons/privcy.svg',
                            width: 30,
                            height: 30,
                          ),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "privacy policy",
                              style: GoogleFonts.readexPro(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ]: [
                            Text(
                              "سياسة الخصوصية",
                              style: GoogleFonts.readexPro(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/privcy.svg',
                              width: 30,
                              height: 30,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        print("privacy");
                        Get.toNamed(AppPath.privacyScreen);
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    GestureDetector(
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                          children: language?[SvgPicture.asset(
                            'assets/icons/phone.svg',
                            width: 30,
                            height: 30,
                          ),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "contact us",
                              style: GoogleFonts.readexPro(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ]:[
                            Text(
                              "تواصل معنا",
                              style: GoogleFonts.readexPro(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/phone.svg',
                              width: 30,
                              height: 30,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        print("contact us");
                        Get.toNamed(AppPath.contactUs);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<SettingController>(builder: (controller) {
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
          })
        ],
      ),
    );
  }
}
