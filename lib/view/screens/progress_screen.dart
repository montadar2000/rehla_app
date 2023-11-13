import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/progress.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';
import 'package:welcome_screen/view/screens/progress_details_screen.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

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
          height: height,
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
                      language?"Progress":"التقدم والدرجات",
                      style: GoogleFonts.readexPro(fontSize: 20),
                    ),
                  ],
                ),
              ),
             SizedBox(height: height*0.05,),
             ...List.generate(controller.coursesController.availableCourses.length, (index) =>
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
                     // Positioned(top:0,right: 0,left: 0,bottom: 0,
                     //     child: SvgPicture.asset(controller.lect[index]['image'])),
                     Column(
                       children: [
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Flexible(child: Container(width: width*0.4,height: 100,
                               child:  FadeInImage.assetNetwork(
                                 placeholder: 'assets/images/loading_gif.gif', // Path to your placeholder image asset
                                 image: controller.coursesController.availableCourses[index].teacherImage!,
                                 width: width * 0.45,
                                 height: height * 0.2,
                                 fit: BoxFit.contain,
                                 imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                   // Return a fallback widget or image when the network image fails to load
                                   return Image.asset('assets/images/teacher_logo.png'); // Replace with your fallback image
                                 },
                               ),
                             )),
                             Flexible(flex: 2,child: Column(
                               crossAxisAlignment: CrossAxisAlignment.end,

                               children: [
                                 Text(controller.coursesController.availableCourses[index].title!,style: GoogleFonts.readexPro(fontSize: 23,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,
                                   maxLines: 2,),
                                 SizedBox(height: 5,),
                                 Text(language?"lect. ":"الاستاذ: "+controller.coursesController.availableCourses[index].teacherName!,style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,
                                 textDirection: language?TextDirection.ltr:TextDirection.rtl,maxLines: 2,),

                               ],
                             )),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Text(controller.coursesController.availableCourses[index].description!,
                           style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w300),textDirection: TextDirection.rtl,maxLines: 3,
                           overflow: TextOverflow.ellipsis,),
                         SizedBox(height: 10,),
                         GestureDetector(
                           onTap: ()  async {
                             if(!controller.coursesController.availableCourses[index].buy!){
                               Get.snackbar(language?"Error":"خطا",language?"please subscribe with course first":"الرجاء الاشتراك في الدورة اولا",snackPosition: SnackPosition.TOP,
                               backgroundColor: AppColors.appRed);
                             }
                             else{
                               controller.coursesController.idExamClickedForProgress=controller.coursesController.availableCourses[index].exam![0].examId!;
                               print(controller.coursesController.idExamClickedForProgress);
                               controller.coursesController.indexCourseClickedForProgress=index;
                               controller.isProgress=true;
                               controller.update();
                               await controller.fetchProgress();
                               //controller.isProgress=false;
                               controller.update();
                               Get.toNamed(AppPath.progressDetailsScreen);

                             }

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
                                   language?"Show Your Progress":"عرض مستوى تقدمك في هذه الدورة",
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
