import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_color.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: AppColors.white,
      body: SafeArea(
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
                        Text("الاعدادات",style: GoogleFonts.readexPro(fontSize: 20),),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward_ios)


                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: height*0.1,),
              Text("تعديل كلمة المرور",style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w600),),
              SizedBox(height: height*0.03,),
              Container(padding: const EdgeInsets.symmetric(horizontal: 15),
                width: width,height: height*0.06,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: AppColors.white
                    ,border: Border.all(width: 0.5)
                ),
                child: Center(
                  child: TextFormField(obscureText: true,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "كلمة المرور الحالية",
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
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "كلمة المرور الجديدة",
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
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "تأكيد كلمة المرور الجديدة",
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
                          Text("الغاء ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600),),

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
                          Text("حفظ ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600,color: AppColors.white),),

                          SvgPicture.asset('assets/icons/done.svg')
                        ],
                      ),

                    ),
                    onTap: (){print('save');









                    },
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
