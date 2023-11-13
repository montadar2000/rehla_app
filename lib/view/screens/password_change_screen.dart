import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/password_change_controller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/view/widgets/progress_dialog.dart';

import '../../constant/app_color.dart';

class PasswordChange extends GetView<PasswordChangeController> {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,left: false,right: false,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      GestureDetector(onTap: (){Get.back();},
                        child: Row(
                          children: [
                            Text(language?"Settings":"الاعدادات",style: GoogleFonts.readexPro(fontSize: 20),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_ios)


                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.1,),
                  Text(language?"Edit your Password":"تعديل كلمة المرور",style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w600),),
                  SizedBox(height: height*0.03,),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: width,height: height*0.06,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: AppColors.white
                        ,border: Border.all(width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(obscureText: true,
                        onChanged: (v){
                        controller.currentPassword=v;
                        },
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: language?"Current Password":"كلمة المرور الحالية",
                            hintStyle: GoogleFonts.readexPro(fontSize: 15)
                        ),),
                    ),),
                  SizedBox(height: height*0.03,),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: width,height: height*0.06,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: AppColors.white
                        ,border: Border.all(width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(obscureText: true,
                        onChanged: (v){
                          controller.newPassword=v;
                        },
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:language?"New Password": "كلمة المرور الجديدة",
                            hintStyle: GoogleFonts.readexPro(fontSize: 15)
                        ),),
                    ),),
                  SizedBox(height: height*0.03,),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: width,height: height*0.06,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: AppColors.white
                        ,border: Border.all(width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(obscureText: true,
                        onChanged: (v){
                          controller.confirmPassword=v;
                        },
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: language?"Confirm Password":"تأكيد كلمة المرور الجديدة",
                            hintStyle: GoogleFonts.readexPro(fontSize: 15)
                        ),),
                    ),),
                  SizedBox(height: height*0.05,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(width: width*0.4,padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              border: Border.all(width: 2)
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(language?"Cancel":"الغاء ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600),),

                              SvgPicture.asset('assets/icons/cancel.svg',)
                            ],
                          ),

                        ),
                        onTap: (){print('cancel');
                        Get.back();},
                      ),
                      GestureDetector(
                        child: Container(width: width*0.4,padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(color: AppColors.appPurpole2,
                              borderRadius:BorderRadius.circular(10),
                              border: Border.all(width: 2,color: AppColors.appPurpole2)


                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(language?"Save":"حفظ ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600,color: AppColors.white),),

                              SvgPicture.asset('assets/icons/done.svg')
                            ],
                          ),

                        ),
                        onTap: () async {print('save');
                          if(controller.newPassword.length>=8){
                            if(controller.newPassword==controller.confirmPassword){
                              await controller.change_password();
                            }
                            else{
                              Get.snackbar(language?"Error":"خطأ",language?"the new password not same as confirm password":"كلمة المرور غير متطابقة",backgroundColor: AppColors.appRed);
                            }

                          }
                          else{

                            Get.snackbar(language?"Error":"خطأ",language?"the password should be greater then 8 chars":"يجب ان تكون كلمة السر اكبر من 8 حروف او ارقام",backgroundColor: AppColors.appRed);
                          }










                        },
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
          GetBuilder<PasswordChangeController>(builder: (controller) {
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
