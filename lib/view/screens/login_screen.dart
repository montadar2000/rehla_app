import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:welcome_screen/controller/login_controller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: width,
            height: height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.jpg'),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("share");
                      },
                      child: Row(
                        children: [
                          Text(
                            language ? "Share" : 'مشاركة',
                            style: GoogleFonts.readexPro(
                                fontSize: 20, color: AppColors.white),
                          ),
                          const Text(" "),
                          SvgPicture.asset(
                            "assets/icons/share.svg",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Container(
                      width: width>900?width*0.25:width*0.4,height:width>900?width*0.25: width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/app_icon.jpg'))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.appWhite),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (v) {
                            controller.phone = v;
                            if (v.length > 3) {
                              if (v[0] == "0") {
                                if (v[1] == "7") {
                                  if (v[2] == '7' ||
                                      v[2] == '8' ||
                                      v[2] == '5' ||
                                      v[2] == '9' ||
                                      v[2] == '6') {
                                    if (v.length == 11) {
                                      controller.loginPhoneGood = true;
                                    } else {
                                      controller.loginPhoneGood = false;
                                    }
                                  } else {
                                    controller.loginPhoneGood = false;
                                  }
                                } else {
                                  controller.loginPhoneGood = false;
                                }
                              } else {
                                controller.loginPhoneGood = false;
                              }
                            } else {
                              controller.loginPhoneGood = false;
                            }
                          },
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: language ? "Phone Number" : "رقم الهاتف",
                              hintStyle: GoogleFonts.readexPro(fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white),
                      child: Center(
                        child: TextFormField(
                          onChanged: (v) {
                            controller.password = v;
                            if (v.length >= 8) {
                              controller.loginPasswordGood = true;
                            } else {
                              controller.loginPasswordGood = false;
                            }
                          },
                          obscureText: true,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: language ? "Password" : "كلمة المرور",
                              hintStyle: GoogleFonts.readexPro(fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppPath.forget);
                              },
                              child: Text(
                                language ? "Forget Password?" : "نسيت كلمة السر؟",
                                style: GoogleFonts.readexPro(
                                    fontSize: 18, color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GetBuilder<LoginController>(
                      builder: (controller) => GestureDetector(
                        onTap: () async {
                          print("sign in");

                          controller.isProgress = true;
                          controller.update();

                          if (controller.loginPhoneGood == false) {
                            Get.snackbar(
                                language ? "Error" : "خطأ",
                                language
                                    ? "Please Enter Valid Number"
                                    : "الرجاء ادخال رقم صالح",
                                backgroundColor: AppColors.appRed,
                                snackPosition: SnackPosition.BOTTOM);
                            controller.isProgress = false;
                            controller.update();
                          } else if (controller.loginPasswordGood == false) {
                            Get.snackbar(
                                language ? "Error" : "خطأ",
                                language
                                    ? "Please Enter Valid Password grater than 8 characters"
                                    : "الدجاء ادخال كلمة مرور صالحة ولا تقل عن 8 حروف او ارقام",
                                backgroundColor: AppColors.appRed,
                                snackPosition: SnackPosition.BOTTOM);
                            controller.isProgress = false;
                            controller.update();
                          } else {
                            await controller.Login_send();
                            if (controller.statusCode != 200) {
                              Get.snackbar(language ? "Error" : "خطأ",
                                  language ? "something wrong" : "حدث خطأ",
                                  backgroundColor: AppColors.appRed,
                                  snackPosition: SnackPosition.BOTTOM);
                              controller.isProgress = false;
                              controller.update();
                            } else {
                              controller.isProgress = false;
                              controller.update();
                              Get.toNamed(AppPath.home);
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: width * 0.8,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.appWhite,
                          ),
                          child: Center(
                              child: Text(
                            language ? "Sign in" : "تسجيل الدخول",
                            style: GoogleFonts.readexPro(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        language
                            ? Row(
                                children: [Text(
                                  "Don't Have Account? ",
                                  style: GoogleFonts.readexPro(
                                      fontSize: 18, color: AppColors.white),
                                  textDirection:TextDirection.ltr
                                ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppPath.registerScreen);
                                    },
                                    child: Text(
                                      "Create New Account",
                                      style: GoogleFonts.readexPro(
                                          fontSize: 18, color: AppColors.white),
                                      textDirection: TextDirection.ltr
                                  ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppPath.registerScreen);
                                    },
                                    child: Text(
                                      "انشاء حساب جديد",
                                      style: GoogleFonts.readexPro(
                                          fontSize: 18, color: AppColors.white),
                                      textDirection: language
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                    ),
                                  ),
                                  Text(
                                    "لاتمتلك حساب؟ ",
                                    style: GoogleFonts.readexPro(
                                        fontSize: 18, color: AppColors.white),
                                    textDirection: language
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                  )
                                ],
                              ),
                      ],
                    ),
                    SizedBox(height: height*0.2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('email');
                              },
                              child: Row(
                                children: [
                                  Text(
                                    language ? "Email" : 'البريد الالكتروني',
                                    style: GoogleFonts.readexPro(
                                        fontSize: 15, color: AppColors.white),
                                  ),
                                  const Text(" "),
                                  SvgPicture.asset(
                                    "assets/icons/email.svg",
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("call us");
                              },
                              child: Row(
                                children: [
                                  Text(
                                    language ? "Contact US" : 'اتصل بنا',
                                    style: GoogleFonts.readexPro(
                                        fontSize: 15, color: AppColors.white),
                                  ),
                                  const Text(" "),
                                  SvgPicture.asset(
                                    "assets/icons/call.svg",
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              language
                                  ? "All Right Reserved to Rehla App 2023"
                                  : 'جميع الحقوق محفوظة لتطبيق رحلة 2023',
                              style: GoogleFonts.readexPro(
                                  fontSize: 15, color: AppColors.white),
                            ),
                            const Text(" "),
                            SvgPicture.asset(
                              "assets/icons/copy_right.svg",
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<LoginController>(builder: (controller) {
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
    ));
  }
}
