import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/progress.dart';
import 'package:welcome_screen/routes/path.dart';

import '../../constant/app_color.dart';

class ProgressScreen extends GetView<ProgressScreenController> {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.only(
              right: 10, left: 10, top: 10, bottom: height * 0.1),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "التقدم والدرجات",
                      style: GoogleFonts.readexPro(fontSize: 20),
                    ),
                  ],
                ),
              ),
             SizedBox(height: height*0.05,),
             ...List.generate(controller.lect.length, (index) =>
                 Container(margin: EdgeInsets.symmetric(vertical: 10),
                 width: width,padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(color: AppColors.appWhite,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.4), // Shadow color
                         blurRadius: 10.0, // Spread radius
                         spreadRadius: 2.0, // Blur radius
                         offset: Offset(4.0, 4.0), // Offset in x and y direction
                       ),]
                 ),
                 child: Stack(
                   children: [
                     Positioned(top:0,right: 0,left: 0,bottom: 0,
                         child: SvgPicture.asset(controller.lect[index]['image'])),
                     Column(
                       children: [
                         Row(mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(controller.lect[index]['lect_name'],style: GoogleFonts.readexPro(fontSize: 22,fontWeight: FontWeight.w500),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(controller.lect[index]['mr_name'],style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Text(controller.lect[index]['desc'],
                           style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w300),textDirection: TextDirection.rtl,maxLines: 3,
                           overflow: TextOverflow.ellipsis,),
                         SizedBox(height: 10,),
                         GestureDetector(
                           onTap: ()  {

                             print("progress");
                             Get.toNamed(AppPath.progressDetailsScreen);

                           },
                           child: Container(
                             padding: const EdgeInsets.all(15),
                             width: width,
                             decoration: BoxDecoration(
                               color: AppColors.appPurpole2,
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "عرض مستوى تقدمك في هذه الدورة",
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
                                   'assets/icons/progress.svg',
                                   width: 25,color: AppColors.white,
                                 )
                               ],
                             ),
                           ),
                         ),
                       ],

                     )
                   ],
                 )
             ))
            ],
          ),
        ),
      ),
    );
  }
}
