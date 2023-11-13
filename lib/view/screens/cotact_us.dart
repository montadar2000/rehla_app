import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_ststic_var.dart';
import 'package:welcome_screen/controller/contact_us_controller.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/main.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class ContactUs extends GetView<ContactUsController> {
   ContactUs({Key? key}) : super(key: key);
HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SafeArea(bottom: false,right: false,left: false,child: SingleChildScrollView(
            child: Container(padding: EdgeInsets.only(top: 10,right: 10,left: 10,bottom: height*0.05),
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
                Text(language?"Contact With Rehla Support":"تواصل مع دعم تطبيق رحلة",style: GoogleFonts.readexPro(fontSize: 21,fontWeight: FontWeight.w600),),
                SizedBox(height: height*0.05,),
                Container(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                  width: width,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: AppColors.white
                      ,border: Border.all(width: 0.5)
                  ),
                  child: Center(
                    child: TextFormField(obscureText: false,controller: TextEditingController(text:
                    homeController.user.firstName+" "+homeController.user.lastName),
                      textAlign: TextAlign.right,maxLines: 1,readOnly: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: language?"Full Name":"الاسم الكامل",
                          hintStyle: GoogleFonts.readexPro(fontSize: 15),
                      ),),
                  ),),
                SizedBox(height: height*0.02,),
                Container(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                  width: width,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: AppColors.white
                      ,border: Border.all(width: 0.5)
                  ),
                  child: Center(
                    child: TextFormField(obscureText: false,maxLines: 1,readOnly: true,
                      controller: TextEditingController(text: homeController.user.phone),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: language?"Phone Number":"رقم الهاتف",
                          hintStyle: GoogleFonts.readexPro(fontSize: 15)
                      ),),
                  ),),
                SizedBox(height: height*0.02,),
                Container(padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: width,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: AppColors.white
                      ,border: Border.all(width: 0.5)
                  ),
                  child: Center(
                    child: TextFormField(obscureText: false,
                      textAlign: TextAlign.right,maxLines: 12,
                      onChanged: (v){
                      controller.message=v;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: language?"Message":"الرسالة او الشكوى",
                          hintStyle: GoogleFonts.readexPro(fontSize: 15)
                      ),),
                  ),),
              //   SizedBox(height: height*0.02,),
              //
              // GestureDetector(onTap: (){print("upload.svg");},
              //   child: DottedBorder(
              //     borderType: BorderType.Rect,
              //
              //     dashPattern: [6, 6],
              //     color: AppColors.black,
              //     strokeWidth: 1,
              //     child: Container(width: width,height: height*0.15,
              //       child: Center(
              //         child: Row(mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text("تحميل ملف إضافي",style: GoogleFonts.readexPro(fontSize: 16),),
              //             SizedBox(width: 15,),
              //             SvgPicture.asset('assets/icons/upload.svg',color: AppColors.black)
              //           ],
              //         ),
              //       ),),),
              // ),
              //   SizedBox(height: height*0.02,),
              //   Row(mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Flexible(
              //         child: Text("أرفق ملف. يجب ألا يتجاوز حجم ملف مستنداتك 10 ميغا بايت",style: GoogleFonts.readexPro(
              //           fontSize: 12,color: AppColors.appGrey
              //         ),),
              //       )
              //     ],
              //   ),
                SizedBox(height: height*0.02,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(width: width*0.4,padding: EdgeInsets.all(10),
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
                      child: Container(width: width*0.4,padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppColors.appPurpole2,
                            borderRadius:BorderRadius.circular(10),
                            border: Border.all(width: 2,color: AppColors.appPurpole2)


                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(language?"Send":"ارسال ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600,color: AppColors.white),),

                            SvgPicture.asset('assets/icons/email.svg')
                          ],
                        ),

                      ),
                      onTap: () async {print('send');
                        if(controller.message.length==0){
                          Get.snackbar(language?"Error":"خطأ", language?"Please enter the message first":"الرجاء كتابة رسالة اولا",
                              backgroundColor: AppColors.appRed,
                              snackPosition: SnackPosition.BOTTOM);
                        }
                        else
                          {
                            controller.isProgress=true;
                            controller.update();
                            if(await controller.send_message()==200){
                              Get.snackbar(language?"Success":"نجح الارسال",language? "Your message send successfully, please wait for our feedback":"تم ارسال الرسالة بنجاح، انتظر الرد من قبل الدعم",
                                  backgroundColor: AppColors.green,
                                  snackPosition: SnackPosition.BOTTOM);
                              controller.isProgress=false;
                              controller.update();
                            }
                            else{
                              Get.snackbar(language?"Error":"خطأ",language? "Your message didn't sent, please try again":"تعذر الارسال، الرجاء اعادة المحاولة",
                                  backgroundColor: AppColors.red,
                                  snackPosition: SnackPosition.BOTTOM);
                              controller.isProgress=false;
                              controller.update();
                            }


                          }







                      },
                    )
                  ],
                ),
                SizedBox(height: height*0.05,),
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/email.svg',color: AppColors.black,width: 25,),
                        SizedBox(width: 10,),
                        Text("loremipsum@gmail.com",style: GoogleFonts.readexPro(fontWeight: FontWeight.w500,fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/call.svg',color: AppColors.black,width: 25,),
                        SizedBox(width: 10,),
                        Text(AppStaticVar.whatsappNumberConnect,style: GoogleFonts.readexPro(fontWeight: FontWeight.w500,fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/location.svg',color: AppColors.black,width: 25,),
                        SizedBox(width: 10,),
                        Text("baghdad, iraq",style: GoogleFonts.readexPro(fontWeight: FontWeight.w500,fontSize: 16),)
                      ],
                    ),

                  ],
                ),
                SizedBox(height: height*0.03,),
                Container(width: width*0.6,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(onTap:(){print("instagram");},
                          child: SvgPicture.asset('assets/icons/instagram.svg',width: 30,color: AppColors.black,)),

                      GestureDetector(onTap:(){print("facebook");},
                          child: SvgPicture.asset('assets/icons/facebook.svg',width: 30,color: AppColors.black,)),


                      GestureDetector(onTap:(){print("linkdin");},
                          child: SvgPicture.asset('assets/icons/linkdin.svg',width: 30,color: AppColors.black,)),


                    ],
                  ),
                )

              ],
            ),),

          ),),
          GetBuilder<ContactUsController>(builder: (controller) {
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
