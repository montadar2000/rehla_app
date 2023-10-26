import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/controller/forget_controller.dart';
import 'package:welcome_screen/controller/otp_controller.dart';
import 'package:welcome_screen/controller/register_controller.dart';
import 'package:welcome_screen/routes/path.dart';

import '../widgets/progress_dialog.dart';

class OtpScreen extends GetView<OtpController> {
  OtpScreen({Key? key}) : super(key: key);
  final ForgetController forgetController=Get.find();
  final RegisterController registerController=Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ),
                        ),
                        Text(" ")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: width * 0.8,
                          height: height * 0.35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/otp.png'))),
                        ),
                        SizedBox(height: height*0.05,),
                        Text("رمز التحقق مرة واحدة",style: GoogleFonts.readexPro(fontWeight: FontWeight.w600,fontSize: 22),),
                        SizedBox(height: height*0.03,),
                        Text("ادخل الرمز المستلم على الرقم : ${forgetController.phoneFiled}" ,style: GoogleFonts.readexPro(fontSize: 15),textDirection: TextDirection.rtl,)
                        ,SizedBox(height: height*0.03,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(width: width*0.13,height: width*0.13,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),color: AppColors.appWhite,
                              border: Border.all(width: 0.3),
                            ),
                            child: TextFormField(maxLength: 1,keyboardType: TextInputType.number,


                              textAlign: TextAlign.center,
                              style: GoogleFonts.readexPro(fontSize: 20),
                              onChanged: (v){
                                controller.otpNumber[0]=v;
                                if (v.length == 1) {
                                  FocusScope.of(context).nextFocus();

                                }


                              },
                              decoration: InputDecoration(counter: Offstage(),
                                  border: InputBorder.none
                              ),
                            ),
                            ),
                            Container(width: width*0.13,height: width*0.13,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: AppColors.appWhite,
                                border: Border.all(width: 0.3),
                              ),
                              child: TextFormField(maxLength: 1,keyboardType: TextInputType.number,


                                textAlign: TextAlign.center,
                                style: GoogleFonts.readexPro(fontSize: 20),
                                onChanged: (v){
                                  controller.otpNumber[1]=v;
                                  if (v.length == 1) {
                                    FocusScope.of(context).nextFocus();

                                  }


                                },
                                decoration: InputDecoration(counter: Offstage(),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(width: width*0.13,height: width*0.13,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: AppColors.appWhite,
                                border: Border.all(width: 0.3),
                              ),
                              child: TextFormField(maxLength: 1,keyboardType: TextInputType.number,


                                textAlign: TextAlign.center,
                                style: GoogleFonts.readexPro(fontSize: 20),
                                onChanged: (v){

                                    controller.otpNumber[2]=v;
                                    if (v.length == 1) {
                                    FocusScope.of(context).nextFocus();

                                  }



                                },
                                decoration: InputDecoration(counter: Offstage(),
                                    border: InputBorder.none
                                ),
                              ),),
                            Container(width: width*0.13,height: width*0.13,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: AppColors.appWhite,
                                border: Border.all(width: 0.3),
                              ),
                              child: TextFormField(maxLength: 1,keyboardType: TextInputType.number,


                                textAlign: TextAlign.center,
                                style: GoogleFonts.readexPro(fontSize: 20),
                                onChanged: (v){

                                    controller.otpNumber[3]=v;
                                    if (v.length == 1) {
                                    FocusScope.of(context).nextFocus();

                                  }



                                },
                                decoration: InputDecoration(counter: Offstage(),
                                    border: InputBorder.none
                                ),
                              ),),
                            Container(width: width*0.13,height: width*0.13,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: AppColors.appWhite,
                                border: Border.all(width: 0.3),
                              ),
                              child: TextFormField(maxLength: 1,keyboardType: TextInputType.number,


                                textAlign: TextAlign.center,
                                style: GoogleFonts.readexPro(fontSize: 20),
                                onChanged: (v){

                                  controller.otpNumber[4]=v;
                                  if (v.length == 1) {
                                    FocusScope.of(context).nextFocus();

                                  }



                                },
                                decoration: InputDecoration(counter: Offstage(),
                                    border: InputBorder.none
                                ),
                              ),),
                            Container(width: width*0.13,height: width*0.13,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: AppColors.appWhite,
                                border: Border.all(width: 0.3),
                              ),
                              child: TextFormField(maxLength: 1,keyboardType: TextInputType.number,


                                textAlign: TextAlign.center,
                                style: GoogleFonts.readexPro(fontSize: 20),
                                onChanged: (v){

                                  controller.otpNumber[5]=v;
                                  if (v.length == 1) {
                                    FocusScope.of(context).enclosingScope;

                                  }



                                },
                                decoration: InputDecoration(counter: Offstage(),
                                    border: InputBorder.none
                                ),
                              ),),

                          ],
                        ),

                        SizedBox(height: height*0.04,),
                        GetBuilder<OtpController>(builder: (controller)=>Text("00:${controller.seconds} sec",style:
                          GoogleFonts.readexPro(fontSize: 17),)),
                        SizedBox(height: height*0.03,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTap:Get.previousRoute=="/forget"? () async {


                              controller.isProgress=true;
                              controller.update();
                              await forgetController.forgetPassword();
                              print(forgetController.statusCode);
                              controller.isProgress=false;
                              print("send again forget");
                              controller.timer.cancel();
                              controller.seconds=120;
                              controller.startTimer();
                              controller.update();
                              if(forgetController.statusCode!=200){
                                Get.snackbar("Error", "something wrong try again",backgroundColor: AppColors.appRed,snackPosition:
                                SnackPosition.BOTTOM);

                              }
                              else{
                                Get.snackbar("Success", "OTP sent successfully",backgroundColor: AppColors.green,snackPosition:
                                SnackPosition.BOTTOM);

                              }
                              }:() async {
                              controller.isProgress=true;
                              controller.update();

                              print("start function");

                              await registerController.sendOtp();
                              print("finish function");
                              if(registerController.statusCodeOTP!=200){

                                Get.snackbar("Error", "something wrong",backgroundColor: AppColors.appRed,snackPosition:
                                SnackPosition.BOTTOM);

                              }
                              else{
                                Get.snackbar("Success", "OTP sent successfully",backgroundColor: AppColors.green,snackPosition:
                                SnackPosition.BOTTOM);
                              }
                              print("send again register");
                              controller.timer.cancel();
                              controller.seconds=120;
                              controller.startTimer();
                              controller.isProgress=false;
                              controller.update();
                            },child: Text(
                              "اعادة ارسال",style: GoogleFonts.readexPro(fontWeight: FontWeight.bold,fontSize: 16),
                            ),),
                            Text("لم يصلك الرمز ؟",style: GoogleFonts.readexPro(fontSize: 16),)
                          ],
                        ),
                        SizedBox(height: height*0.05,),
                       GetBuilder<OtpController>(builder: (controller)=> GestureDetector(
                           onTap: controller.seconds!=0&&controller.convertOtpTONumber()!=0?Get.previousRoute=="/registerScreen"?
                               () async {
                             controller.isProgress=true;
                             controller.update();
                             print("next");
                             print(controller.convertOtpTONumber());

                             Map<String,dynamic> response=await controller.verification(registerController.phone);
                             if(controller.stausCode==200){
                               Get.offAllNamed(AppPath.login);
                               Get.snackbar("Error", "Register Successfully, Now you can login",backgroundColor: AppColors.green,snackPosition:
                               SnackPosition.BOTTOM);
                               controller.isProgress=false;
                               controller.update();
                             }
                             else{
                               Get.snackbar("Error", "Please Try Again",backgroundColor: AppColors.appRed,snackPosition:
                               SnackPosition.BOTTOM);
                               controller.isProgress=false;
                               controller.update();
                             }
                             print(registerController.phone);
                             print(response);

                           }:(){
                             print("forget");
                           }:null,
                           child: Container(padding: EdgeInsets.all(10),
                             width: width,height: height*0.07,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:controller.seconds!=0&&controller.convertOtpTONumber()!=0?AppColors.appPurpole4:AppColors.appPurpole2,),
                             child: Center(child: Text("التالي",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.white),)),
                           ))),


                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<OtpController>(
              builder: (controller) {print("update");
              return controller.isProgress?Positioned(top: 0,right: 0,bottom: 0,left: 0,
                  child: ProgressDialog(width: width,height: height,)
              ):Container();
              })
        ],
      ),
    );
  }
}
