import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/controller/start_controller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/view/widgets/pdf_reader.dart';

class PrepareScreen extends GetView<StartVideoController> {
  const PrepareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(padding: EdgeInsets.symmetric(horizontal: 20),
        width: width,
        child: SafeArea(
          bottom: false,right: false,left: false,
          child: Column(
            children: [
              GestureDetector(onTap: (){print("back");
                Get.back();},
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios,size: 25,),
                    Text(language?"Lectures Menu":"قائمة المحاضرات",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),)
                  ],
                ),

              )
              ,
              SizedBox(height: height*0.1,),
              Row(mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                children: [
                  Text(language?"Lecture Detail":"تفاصيل المحاضرة",style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w500),)

                ],
              ),
              SizedBox(height: height*0.02,),
              Row(mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                children: [
                  Text(controller.title,style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w500),)

                ],
              ),
              SizedBox(height: height*0.01,),
              Text(controller.description,
                style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w300),
              textAlign: TextAlign.end,),
              SizedBox(height: height*0.01,),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(
                  controller: controller.betterPlayerController,
                ),
              ),
              SizedBox(height: height*0.05,),
              GestureDetector(onTap: (){
                print("download PDF");
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) =>  PDFViewerCachedFromUrl(
                      url: controller.fileUrl,
                    ),
                  ),
                );

              },
                child: Container(padding: EdgeInsets.all(20),
                  width: width,decoration: BoxDecoration(
                  color: AppColors.appPurpole2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:language?[ SvgPicture.asset('assets/icons/pdf.svg'),

                    SizedBox(width: 5,),
                    Text("download lecture details as PDF",style: GoogleFonts.readexPro(
                        fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.white
                    ),textDirection: TextDirection.ltr,),
                  ]: [
                    Text("تحميل المحاضرة بصيغة PDF",style: GoogleFonts.readexPro(
                      fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.white
                    ),textDirection: TextDirection.rtl,),
                    SizedBox(width: 5,),
                    SvgPicture.asset('assets/icons/pdf.svg')
                ],),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
