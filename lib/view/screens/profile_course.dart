import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/routes/path.dart';

import '../../constant/app_color.dart';
import '../../constant/app_ststic_var.dart';
import '../../main.dart';

class ProfileCourse extends StatelessWidget {
   ProfileCourse({Key? key}) : super(key: key);
  HomeController homeController=Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10,right: 10,left: 10,
                bottom: height*0.1),
            width: width,child: (
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(child: SvgPicture.asset('assets/icons/setting.svg',width: 30,height: 30,),
                        onTap: (){print("settings");
                        Get.toNamed(AppPath.settingScreen);
                        },),
                      GestureDetector(onTap: (){Get.back();},
                        child: Row(
                          children: [
                            Text(language?"my profile":"ملفي الشخصي",style: GoogleFonts.readexPro(fontSize: 20),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_ios)


                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.1,),
                  Builder(
                      builder: (context) {
                        if(homeController.user.photo == ""){

                          return  CircleAvatar(backgroundColor: AppColors.white,
                            radius: 55,
                            backgroundImage: AssetImage("assets/images/user_image.png"),

                          );}
                        else{
                          return CircleAvatar(backgroundColor: AppColors.white,
                              radius: 55,
                              backgroundImage:NetworkImage(homeController.user.photo));

                        }

                      }),
                  SizedBox(height: height*0.02,),
                  Text(homeController.user.firstName +" "+ homeController.user.lastName,style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w600),),
                  SizedBox(height: height*0.03,),


                  Row(mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                    children: [
                      Column(crossAxisAlignment:language?CrossAxisAlignment.start: CrossAxisAlignment.end,
                        children:language? [
                          Text("subscription status ",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text("current plan : ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w500),textDirection: TextDirection.ltr),

                              Text("paid plan",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.green),textDirection: TextDirection.ltr,),

                            ],
                          ),
                          // SizedBox(height: 15,),

                          // Row(
                          //   children: [
                          //     Text("renewal date : ",style: GoogleFonts.readexPro(fontSize: 17,),),
                          //     Text("01/01/2024",style: GoogleFonts.readexPro(fontSize: 17,),),
                          //   ],
                          // ),

                        ]:[
                          Text("حالة الاشتراك",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(" دورة مدفوعة",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.green),textDirection: TextDirection.rtl,),
                              Text("الخطة الحالية :",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl),

                            ],
                          ),
                          // SizedBox(height: 15,),
                          // Text("تاريخ تجديد الاشتراك: 01/01/2024",style: GoogleFonts.readexPro(fontSize: 17,),),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  GestureDetector(
                    onTap: () async {

                      print("update sub");
                      try {
                        Uri url = Uri.parse('https://wa.me/${AppStaticVar.whatsappNumberConnect}'); // Replace with your desired URL
                        if (!await launchUrl(url)) {
                          print('Could not launch $url');
                        }
                      } catch (e) {
                        print('Error: $e');
                        // Handle the error, e.g., show a message to the user
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
                        children: language?[SvgPicture.asset(
                          'assets/icons/crown.svg',
                          width: 20,
                        ),

                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "update subscription",
                            style: GoogleFonts.readexPro(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                            textDirection: TextDirection.ltr,
                          ),
                        ]:[
                          Text(
                            "تحديث الاشتراك",
                            style: GoogleFonts.readexPro(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/crown.svg',
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  GestureDetector(
                    onTap: ()  async {

                      print("cancel");
                      try {
                        Uri url = Uri.parse('https://wa.me/${AppStaticVar.whatsappNumberConnect}'); // Replace with your desired URL
                        if (!await launchUrl(url)) {
                      print('Could not launch $url');
                      }
                      } catch (e) {
                      print('Error: $e');
                      // Handle the error, e.g., show a message to the user
                      }

                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: width,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(width: 2.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset(
                          'assets/icons/cancel.svg',
                          width: 20,
                        ),

                          const SizedBox(
                            width: 10,
                          ),Text(
                            "cancel subscription",
                            style: GoogleFonts.readexPro(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black),
                            textDirection: TextDirection.rtl,
                          ),

                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: height*0.03,),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding:
                    EdgeInsets.all(10),
                    decoration:
                    BoxDecoration(
                      borderRadius:
                      BorderRadius
                          .circular(20),
                      color: AppColors
                          .appWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(
                              0.4),
                          // Shadow color
                          blurRadius: 10.0,
                          // Spread radius
                          spreadRadius: 2.0,
                          // Blur radius
                          offset: Offset(
                              4.0,
                              4.0), // Offset in x and y direction
                        ),
                      ],
                    ),
                    width: width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .end,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .end,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .start,
                              children: [
                                Text(
                                  homeController.coursesController.availableCourses[homeController.coursesController.profileCourseSelectedIndex].title!,
                                  style: GoogleFonts.readexPro(
                                      fontWeight: FontWeight
                                          .w600,
                                      fontSize:
                                      25),
                                ),
                                SizedBox(
                                  height:
                                  10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeController.coursesController.availableCourses[homeController.coursesController.profileCourseSelectedIndex].teacherName!,
                                      style: GoogleFonts.readexPro(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.appPurpole2),
                                    ),
                                    SizedBox(
                                      width:
                                      5,
                                    ),
                                    SvgPicture
                                        .asset(
                                      'assets/icons/small_person.svg',
                                      width:
                                      25,
                                      height:
                                      25,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width *
                                  0.03,
                            ),
                            Container(
                              width: width *
                                  0.2,
                              height:
                              height *
                                  0.1,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading_gif.gif', // Path to your placeholder image asset
                                image: homeController.coursesController.availableCourses[homeController.coursesController.profileCourseSelectedIndex].teacherImage!,
                                width: width * 0.45,
                                height: height * 0.2,
                                fit: BoxFit.contain,
                                imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  // Return a fallback widget or image when the network image fails to load
                                  return Image.asset('assets/images/teacher_logo.png'); // Replace with your fallback image
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Row(
                        //   mainAxisAlignment:
                        //   MainAxisAlignment
                        //       .spaceBetween,
                        //   children: [
                        //     Text(
                        //       "اكملت ٥٠٪ من الدورة",
                        //       style: GoogleFonts.readexPro(
                        //           fontSize:
                        //           16,
                        //           color: AppColors
                        //               .appPurpole1),
                        //     ),
                        //     Text(
                        //       "مستوى تقدمك",
                        //       style: GoogleFonts
                        //           .readexPro(
                        //           fontSize:
                        //           16),
                        //     ),
                        //   ],
                        // ),
                        //
                        //
                        // Container(
                        //   width: width,
                        //   child: SliderTheme(
                        //     data: SliderThemeData(
                        //       thumbShape: SliderComponentShape.noThumb,
                        //       trackHeight: 10.0, // Customize the track height
                        //     ),
                        //     child: Slider(
                        //       activeColor: AppColors.appPurpole5,
                        //       inactiveColor: AppColors.appPurpole2,
                        //       value: 50,
                        //       onChanged: (v) {
                        //         // This callback is invoked when the slider value changes.
                        //         // You can put your custom logic here.
                        //       },
                        //       min: 0.0,
                        //       max: 100.0,
                        //     ),
                        //   ),
                        // ),




                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${homeController.coursesController.availableCourses[homeController.coursesController.profileCourseSelectedIndex].countOfCourses}",
                                  style: GoogleFonts.readexPro(
                                      fontSize:
                                      16,
                                      color:
                                      AppColors.appPurpole1),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture
                                    .asset(
                                    'assets/icons/lect.svg'),
                              ],
                            ),
                            GestureDetector(
                              child:
                              SvgPicture
                                  .asset(
                                'assets/icons/play.svg',
                                width: 60,
                                height: 60,
                              ),
                              onTap: () {



                                print("play");
                                homeController.coursesController.indexCourseClicked=homeController.coursesController.profileCourseSelectedIndex;
                                Get.toNamed(AppPath.detailsScreen);

                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),),
        )
      ),
    );
  }
}
