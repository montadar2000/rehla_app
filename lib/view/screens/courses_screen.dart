import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/courses_controller.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';

import '../../Model/course_model.dart';
import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class Courses extends GetView<CoursesController> {
   Courses({Key? key}) : super(key: key);
 final HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: width,height: height,
          padding: EdgeInsets.only(
              right: 10, left: 10, top: 10, bottom: height * 0.1),
          child: SafeArea(
            right: false,
            left: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(mainAxisAlignment: language?MainAxisAlignment.start:MainAxisAlignment.end,
                    children: language?[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Builder(
                              builder: (_) {
                                if(homeController.user.photo != "") {
                                  return CircleAvatar(
                                      radius: 30,
                                      backgroundColor: AppColors.white,
                                      backgroundImage:NetworkImage(homeController.user.photo)
                                  );
                                } else{
                                  return  CircleAvatar(backgroundColor: AppColors.white,
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/user_image.png")
                                  );

                                }

                              }),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "hello, "+homeController.user.firstName+" "+homeController.user.lastName,
                                style: GoogleFonts.readexPro(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textDirection: TextDirection.ltr,),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "let's start learning !",
                                style: GoogleFonts.readexPro(
                                    fontSize: 16, color: AppColors.appPurpole1),
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ],
                      ),


                    ]:[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "مرحبا، "+homeController.user.firstName+" "+homeController.user.lastName,
                                style: GoogleFonts.readexPro(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl,),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "لنبدا رحلة التعلم اليوم!",
                                style: GoogleFonts.readexPro(
                                    fontSize: 16, color: AppColors.appPurpole1),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Builder(
                              builder: (_) {
                                if(homeController.user.photo != "") {
                                  return CircleAvatar(
                                      radius: 30,
                                      backgroundColor: AppColors.white,
                                      backgroundImage:NetworkImage(homeController.user.photo)
                                  );
                                } else{
                                  return  CircleAvatar(backgroundColor: AppColors.white,
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/user_image.png")
                                  );

                                }

                              }),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: language?MainAxisAlignment.start:MainAxisAlignment.end,
                    children: [
                      Text(
                        language?"available courses":"الدورات المتوفرة",
                        style: GoogleFonts.readexPro(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  GetBuilder<CoursesController>(builder: (controller)=>Column(
                    children: [
                      ...List.generate(
                          controller.internetIssue?1:controller.availableCourses.length,
                              (index) {
                            if(controller.internetIssue){

                              return Column(
                                children: [
                                SizedBox(height: height*0.2,),
                                  Text(language?"internet issue":"خطا في الاتصال في الانترنت",style: GoogleFonts.readexPro(
                                    fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.appRed
                                  ),),
                                ],
                              );
                            }
                                return Container(
                            margin: EdgeInsets.only(bottom: 25),
                            padding: EdgeInsets.all(10),
                            width: width,
                            decoration: BoxDecoration(
                                color: AppColors.appWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    // Shadow color
                                    blurRadius: 10.0,
                                    // Spread radius
                                    spreadRadius: 2.0,
                                    // Blur radius
                                    offset: Offset(
                                        4.0, 4.0), // Offset in x and y direction
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                //   controller.availableCourses[index].teacherImage==null?Positioned(top: 0,right: 0,bottom: 0,left: 0,
                                //   child: Container(width: width*0.3,height: height*0.1,
                                //     decoration: BoxDecoration(image: DecorationImage(image: AssetImage(
                                //         controller.availableCourses[index]['default_background']
                                //     ))),),
                                // ):Container(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,


                                  children: language?[
                                    //courses[0].courseVideos![0].uriVideo
                                    SizedBox(width: width*0.4,height: 200,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.availableCourses[index]
                                                .title!,
                                            style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textDirection: TextDirection.ltr,),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Lect. ${controller.availableCourses[index]
                                                .teacherName}',
                                            style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textDirection: TextDirection.ltr, ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment.start  ,
                                            children: [SvgPicture.asset(
                                              'assets/icons/dollar.svg',
                                              width: 10,
                                              color: AppColors.appGrey,
                                            ),

                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${controller.availableCourses[index]
                                                    .price}  Iraqi Dinar",
                                                textDirection: TextDirection.ltr,
                                                style: GoogleFonts.readexPro(
                                                    fontSize: 14,
                                                    color: AppColors.appGrey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment.start,
                                            children: [SvgPicture.asset(
                                              'assets/icons/timer.svg',
                                              width: 15,
                                              color: AppColors.appGrey,
                                            ),

                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${controller.availableCourses[index]
                                                    .duration}",
                                                textDirection: TextDirection.ltr,
                                                style: GoogleFonts.readexPro(
                                                    fontSize: 14,
                                                    color: AppColors.appGrey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          controller.availableCourses[index]
                                              .teacherImage !=
                                              null
                                              ? GestureDetector(
                                            onTap: () {
                                              print("details");
                                              print(controller.availableCourses[index].id);
                                              controller.idCourseClicked=controller.availableCourses[index].id!;
                                              for(int i=0;i<controller.availableCourses.length;i++){
                                                if(controller.idCourseClicked==controller.availableCourses[index].id){
                                                  controller.indexCourseClicked=index;
                                                }
                                              }

                                              Get.toNamed(AppPath.detailsScreen);

                                            },
                                            child: Container(
                                              width: width * 0.3,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  border:
                                                  Border.all(width: 2)),
                                              child: Center(
                                                child: Text(
                                                  language?"Details":"التفاصيل",
                                                  style:
                                                  GoogleFonts.readexPro(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                              ),
                                            ),
                                          )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: width*0.4,height: 200,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/loading_gif.gif', // Path to your placeholder image asset
                                        image: controller.availableCourses[index].teacherImage!,
                                        width: width * 0.45,
                                        height: height * 0.2,
                                        fit: BoxFit.contain,
                                        imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                          // Return a fallback widget or image when the network image fails to load
                                          return Image.asset('assets/images/teacher_logo.png'); // Replace with your fallback image
                                        },
                                      ),
                                    ),

                                  ]:
                                  [
                                    //courses[0].courseVideos![0].uriVideo
                                    SizedBox(width: width*0.4,height: 200,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/loading_gif.gif', // Path to your placeholder image asset
                                        image: controller.availableCourses[index].teacherImage!,
                                        width: width * 0.45,
                                        height: height * 0.2,
                                        fit: BoxFit.contain,
                                        imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                          // Return a fallback widget or image when the network image fails to load
                                          return Image.asset('assets/images/teacher_logo.png'); // Replace with your fallback image
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width*0.4,height: 200,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            controller.availableCourses[index]
                                                .title!,
                                            style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textDirection: TextDirection.rtl,),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'الاستاذ : ${controller.availableCourses[index]
                                                .teacherName}',
                                            style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textDirection: TextDirection.rtl, ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${controller.availableCourses[index]
                                                    .price} دينار عراقي",
                                                textDirection: TextDirection.rtl,
                                                style: GoogleFonts.readexPro(
                                                    fontSize: 14,
                                                    color: AppColors.appGrey),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/dollar.svg',
                                                width: 10,
                                                color: AppColors.appGrey,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${controller.availableCourses[index]
                                                    .duration}",
                                                textDirection: TextDirection.rtl,
                                                style: GoogleFonts.readexPro(
                                                    fontSize: 14,
                                                    color: AppColors.appGrey),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/timer.svg',
                                                width: 15,
                                                color: AppColors.appGrey,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          controller.availableCourses[index]
                                              .teacherImage !=
                                              null
                                              ? GestureDetector(
                                            onTap: () {
                                              print("details");
                                              print(controller.availableCourses[index].id);
                                              controller.idCourseClicked=controller.availableCourses[index].id!;
                                              for(int i=0;i<controller.availableCourses.length;i++){
                                                if(controller.idCourseClicked==controller.availableCourses[index].id){
                                                  controller.indexCourseClicked=index;
                                                }
                                              }

                                              Get.toNamed(AppPath.detailsScreen);

                                            },
                                            child: Container(
                                              width: width * 0.3,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  border:
                                                  Border.all(width: 2)),
                                              child: Center(
                                                child: Text(
                                                  language?"Details":"التفاصيل",
                                                  style:
                                                  GoogleFonts.readexPro(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                              ),
                                            ),
                                          )
                                              : Container()
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                              }
                      )


                    ],
                  ))



                ],
              ),
            ),
          ),
        ),
        GetBuilder<CoursesController>(
            builder: (controller) {print("update");
            return controller.isProgress?Positioned(top: 0,right: 0,bottom: 0,left: 0,
                child: ProgressDialog(width: width,height: height,)
            ):Container();
            })
      ],
    );
  }
}
