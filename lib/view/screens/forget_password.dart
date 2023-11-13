import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/forget_controller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class ForgetPassword extends GetView<ForgetController> {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Container(padding: EdgeInsets.all(20),
            width: width,height: height,
            child: SingleChildScrollView(
              child: SafeArea(bottom: false,right: false,left: false,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("back");
                        Get.back();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: AppColors.black,),
                          SizedBox(width: 5,),
                          Text(
                            language?"Sign in":'تسجيل الدخول',
                            style: GoogleFonts.readexPro(
                                fontSize: 18, color: AppColors.black),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: width*0.8,
                      height: height*0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/forget.png")
                          )
                      ),
                    ),
                    SizedBox(height: height*0.1,),
                    Text(language?"Are You Forget the Password?":"هل نسيت كلمة السر؟",style:GoogleFonts.readexPro(fontSize: 27,fontWeight: FontWeight.bold),textDirection: language?TextDirection.ltr:TextDirection.rtl,),
                    SizedBox(height: height*0.05,),
                    Text(language?"Don't worry ! This happens sometimes. Please enter your phone number so we can send the OTP code":"لاتقلق ! هذا يحدث في بعض الاحيان. الرجاء ادخال رقم الهاتف كي نرسل رمز OTP",style:GoogleFonts.readexPro(fontSize: 16,),textAlign: TextAlign.center,textDirection:language?TextDirection.ltr: TextDirection.rtl),
                    SizedBox(height: height*0.04,),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: width,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),color: AppColors.appWhite,
                          border: Border.all(width: 0.2,)
                      ),
                      child: Center(
                        child: TextFormField(onChanged: (v){
                          if(v.length==11){
                            if(v[0]=="0"){
                              if(v[1]=="7"){
                                if(v[2]=='7'||v[2]=='8'||v[2]=='5'||v[2]=='9'||v[2]=='6'){
                                  controller.loginPhoneGood=true;
                                  controller.phoneFiled=v;
                                  controller.update();
                                }
                                else{
                                  controller.loginPhoneGood=false;
                                  controller.update();


                                }
                              }
                              else{
                                controller.loginPhoneGood=false;
                                controller.update();


                              }
                            }
                            else{
                              controller.loginPhoneGood=false;
                              controller.update();


                            }
                          }
                          else{
                            controller.loginPhoneGood=false;
                            controller.update();


                          }


                        },
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: language?"Phone Number":"رقم الهاتف",
                              hintStyle: GoogleFonts.readexPro(fontSize: 15)
                          ),),
                      ),),
                    SizedBox(height: height*0.05,),
                    GetBuilder<ForgetController>(builder: (controller)=> GestureDetector(
                        onTap: controller.loginPhoneGood?() async {
                          controller.isProgress=true;
                          controller.update();
                          await controller.forgetPassword();
                          print(controller.statusCode);
                          controller.isProgress=false;
                          controller.update();
                          if(controller.statusCode!=200){
                            Get.snackbar(language?"Error":"خطأ", language?"something wrong":"حدث خطأ",backgroundColor: AppColors.appRed,snackPosition:
                            SnackPosition.BOTTOM);

                          }
                          else{
                          Get.toNamed(AppPath.otp);}
                        }:null,
                        child: Container(padding: EdgeInsets.all(10),
                          width: width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: !controller.loginPhoneGood?AppColors.appPurpole2:AppColors.appPurpole4,),
                          child: Center(child: Text(language?"Next":"التالي",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.white),)),
                        )),
                    )
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<ForgetController>(
              builder: (controller) {print("update");
              return controller.isProgress?Positioned(top: 0,right: 0,bottom: 0,left: 0,
                  child: ProgressDialog(width: width,height: height,)
              ):Container();
              })
        ],
      )
    );
  }
}
