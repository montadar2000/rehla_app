import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/exam_controller.dart';
import 'package:welcome_screen/controller/exam_status_controller.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class ExamStatus extends GetView<ExamStatusController> {
  ExamStatus({Key? key}) : super(key: key);


ExamController examController=Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<ExamStatusController>(builder: (controller)=>Stack(
        children: [
          SafeArea(
            child: Container(padding: EdgeInsets.all(20),width: width,height: height,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('back');
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                        ),
                        Text(
                          "الاختبار",
                          style: GoogleFonts.readexPro(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.1,),
                  controller.status?Column(
                    children: [
                      Container(width: width,height: height*0.3,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/send_success.png'))),
                      ),
                      SizedBox(height: height*0.07,),
                      Text('تم ارسال اجاباتك ! ',style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
                      SizedBox(height: height*0.02,),
                      Text('يمكنك ايجاد درجة الامتحان في ملفك الشخصي بعد تصحيح الاجابات من قبل مشرف المادة',style: GoogleFonts.readexPro(fontSize: 16,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,),
                      SizedBox(height: height*0.05,),
                      GestureDetector(
                        onTap: () async {

                          print("back");
                          Get.back();

                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: width,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "العودة الى صفحة الدورة",
                                style: GoogleFonts.readexPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                'assets/icons/arrow_right.svg',
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ):
                  Column(
                    children: [
                      Container(width: width,height: height*0.3,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/send_fail.png'))),
                      ),
                      SizedBox(height: height*0.07,),
                      Text('حدث خطأ',style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
                      SizedBox(height: height*0.02,),
                      Text(' يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. في حال استمرار المشكلة، يُرجى التواصل مع فريق الدعم او مشرف المادة',style: GoogleFonts.readexPro(fontSize: 16,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,),
                      SizedBox(height: height*0.05,),
                      GestureDetector(
                        onTap: () async {

                          controller.isProgress=true;
                          controller.update();

                          await examController.uploadFile();

                          controller.isProgress=false;
                          controller.update();

                          if(examController.uploadStatus){
                            controller.status=true;
                            examController.filePath=null;
                            examController.update();
                          }
                          else{
                            Get.snackbar("Error", "there is something Wrong please try again later",
                                snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.appRed);

                          }

                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.appPurpole2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اعادة المحاولة",
                                style: GoogleFonts.readexPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                'assets/icons/retry.svg',
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
          controller.isProgress
              ? Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: ProgressDialog(
                width: width,
                height: height,
              ))
              : Container()


        ],
      )),
    );
  }
}
