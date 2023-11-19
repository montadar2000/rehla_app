import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/constant/app_ststic_var.dart';
import 'package:welcome_screen/controller/courses_controller.dart';
import 'package:welcome_screen/controller/details_contriller.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';

import '../widgets/pdf_reader.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoursesController coursesController=Get.find();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),

            width: width,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print('back');
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      ),
                      Text(
                        language?"course detail":"تفاصيل الدورة",
                        style: GoogleFonts.readexPro(fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  width: width,
                  height:height<500?height*0.6:height*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.appWhite,
                    //border: Border.all(width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6), // Shadow color
                        blurRadius: 5.0, // Spread radius
                        spreadRadius: 1.0, // Blur radius
                        offset: const Offset(4.0, 4.0), // Offset in x and y direction
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: width,
                          height: height<500?height * 0.35:height*0.2,
                          padding: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${coursesController.availableCourses[coursesController.indexCourseClicked].cover}"),
                                  fit: BoxFit.fill)
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    coursesController.availableCourses[coursesController.indexCourseClicked].title!,
                                    style: GoogleFonts.readexPro(
                                        fontSize: 30,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600),
                                  textDirection: TextDirection.rtl,)
                                ],
                              ),
                              SizedBox(
                                height:height<500?height * 0.03: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                                children:language?[SvgPicture.asset(
                                  'assets/icons/small_person.svg',
                                  color: AppColors.white,
                                ),

                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Lect. "+"${coursesController.availableCourses[coursesController.indexCourseClicked].teacherName}",
                                    style: GoogleFonts.readexPro(
                                        fontSize: 20, color: AppColors.white),
                                    textDirection: TextDirection.ltr,),
                                ]: [
                                  Text(
                                    "الاستاذ "+"${coursesController.availableCourses[coursesController.indexCourseClicked].teacherName}",
                                    style: GoogleFonts.readexPro(
                                        fontSize: 20, color: AppColors.white),
                                  textDirection: TextDirection.rtl,),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/small_person.svg',
                                    color: AppColors.white,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${coursesController.availableCourses[coursesController.indexCourseClicked].description}",
                                style: GoogleFonts.readexPro(
                                    fontSize: 15, color: AppColors.white),
                                textAlign: TextAlign.start,
                                textDirection: language?TextDirection.ltr:TextDirection.rtl,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                          flex: controller.subscribe?1:2,
                          child: Container(
                        width: width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:language?MainAxisAlignment.start: MainAxisAlignment.end,
                              children:language?[SvgPicture.asset('assets/icons/lect.svg',
                                  color: AppColors.black),

                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${coursesController.availableCourses[coursesController.indexCourseClicked].countOfCourses}"+" Lectures",
                                  style: GoogleFonts.readexPro(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ]: [
                                Text(
                                  "${coursesController.availableCourses[coursesController.indexCourseClicked].countOfCourses}"+" محاضرة",
                                  style: GoogleFonts.readexPro(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/icons/lect.svg',
                                    color: AppColors.black)
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: language?MainAxisAlignment.start:MainAxisAlignment.end,
                              children:language?[SvgPicture.asset(
                                'assets/icons/dollar.svg',
                                color: AppColors.black,
                              ),

                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${coursesController.availableCourses[coursesController.indexCourseClicked].price}"+" Iraqi Dinar",
                                  style: GoogleFonts.readexPro(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ]: [
                                Text(
                                  "${coursesController.availableCourses[coursesController.indexCourseClicked].price}"+" دينار عراقي",
                                  style: GoogleFonts.readexPro(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/dollar.svg',
                                  color: AppColors.black,
                                )
                              ],
                            ),
                            controller.subscribe?Container(): SizedBox(
                              height: height * 0.02,
                            ),
                            controller.subscribe?Container():GestureDetector(
                              onTap: () {
                                print("subscribe");
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
                                      width: 5,
                                    ),
                                    Text(
                                      "subscribe to course",
                                      style: GoogleFonts.readexPro(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ]:[
                                    Text(
                                      "اشترك في الدورة",
                                      style: GoogleFonts.readexPro(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/crown.svg',
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GetBuilder<DetailsController>(builder: (controller)=>Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(onTap: (){
                      controller.lectList=false;
                      controller.update();
                    },
                      child: AnimatedContainer(duration: const Duration(milliseconds: 500),
                        decoration:!controller.lectList? const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: AppColors.appPurpole5)),

                        ):const BoxDecoration(),
                        child: Row(
                          children: [
                            // SvgPicture.asset('assets/icons/crown.svg'),
                            // SizedBox(width: 5,),
                            Text(
                              language?"Exams Menu":"قائمة الامتحانات",
                              style: GoogleFonts.readexPro(
                                  fontSize: 18,
                                  color: !controller.lectList?AppColors.appPurpole5:AppColors.appGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                      controller.lectList=true;
                      controller.update();
                    },
                      child: AnimatedContainer(duration: const Duration(milliseconds: 500),
                        decoration:controller.lectList? const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: AppColors.appPurpole5)),

                        ):const BoxDecoration(),
                        child: Text(
                          language?"Lectures Menu":"قائمة المحاضرات",
                          style: GoogleFonts.readexPro(
                              fontSize: 18,
                              color: controller.lectList?AppColors.appPurpole5:AppColors.appGrey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    
                  ],
                )),
                SizedBox(
                  height: height * 0.04,
                ),
                GetBuilder<DetailsController>(builder: (controller)=>
                controller.lectList?coursesController.availableCourses[coursesController.indexCourseClicked].buy!?
                Column(
                  children: [
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.appWhite,
                        //border: Border.all(width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), // Shadow color
                            blurRadius: 5.0, // Spread radius
                            spreadRadius: 1.0, // Blur radius
                            offset: const Offset(4.0, 4.0), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: Column(children: [
                        ...List.generate(
                          controller.list.length,
                              (index) => Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: width,
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: !controller.subscribe&&index>2?Center(
                                          child: SvgPicture.asset("assets/icons/lock.svg",width: 25,),
                                        ):Row(
                                          children: [
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                'assets/icons/play_video_left.svg',
                                                width: 35,
                                              ),onTap: (){
                                             // print(controller.chemistryLectures[index]['video_url']);
                                              print(controller.list[index].uriVideo);
                                              Get.toNamed(AppPath.prepareScreen);
                                            },
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(onTap: (){
                                              print(controller.list[index].uriPDF);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (_) =>  PDFViewerCachedFromUrl(
                                                  url: controller.list[index].uriPDF ,
                                                ),
                                              ),
                                            );


                                            },
                                              child: SvgPicture.asset(
                                                'assets/icons/download.svg',
                                                width: 35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Text(
                                          controller.list[index].title,
                                          style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                        textDirection: TextDirection.rtl,),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  controller.indexClicked=index;
                                  print(controller.indexClicked);

                                  Get.toNamed(AppPath.prepareScreen);},
                              ),

                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ):Column(
                  children: [
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.appWhite,
                        //border: Border.all(width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), // Shadow color
                            blurRadius: 5.0, // Spread radius
                            spreadRadius: 1.0, // Blur radius
                            offset: const Offset(4.0, 4.0), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: Column(children: [
                        ...List.generate(
                          controller.list.length>3?3:controller.list.length,
                              (index) => Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: width,
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: !controller.subscribe&&index>2?Center(
                                          child: SvgPicture.asset("assets/icons/lock.svg",width: 25,),
                                        ):Row(
                                          children: [
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                'assets/icons/play_video_left.svg',
                                                width: 35,
                                              ),onTap: (){
                                              // print(controller.chemistryLectures[index]['video_url']);
                                              print(controller.list[index].uriVideo);
                                              Get.toNamed(AppPath.prepareScreen);
                                            },
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(onTap: (){
                                              print(controller.list[index].uriPDF);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder: (_) =>  PDFViewerCachedFromUrl(
                                                    url: controller.list[index].uriPDF ,
                                                  ),
                                                ),
                                              );


                                            },
                                              child: SvgPicture.asset(
                                                'assets/icons/download.svg',
                                                width: 35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Text(
                                          controller.list[index].title,
                                          style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: TextDirection.rtl,),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  controller.indexClicked=index;
                                  print(controller.indexClicked);

                                  Get.toNamed(AppPath.prepareScreen);},
                              ),

                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: height*0.05,),
                    TextButton(onPressed: () async {
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
                        child: Text(language?"To Proceed watching lectures, Please Subscribe From here":"لمتابعة المزيد من المحاضرات الرجاء الاشتراك من هنا",style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w500,
                        color: AppColors.black),textAlign: TextAlign.center,)),
                  ],
                ):
                coursesController.availableCourses[coursesController.indexCourseClicked].buy!?Column(
                  children: [
                    controller.list2.length!=0?Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.appWhite,
                        //border: Border.all(width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), // Shadow color
                            blurRadius: 5.0, // Spread radius
                            spreadRadius: 1.0, // Blur radius
                            offset: const Offset(4.0, 4.0), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: Column(children: [
                        ...List.generate(
                          controller.list2.length,
                              (index) => Column(
                            children: [
                              GestureDetector(
                                child: Container(

                                  width: width,
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: GestureDetector(onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context){

                                            return PDFViewerCachedFromUrl(url:controller.list2[index].exams[0].attachment );
                                          }));
                                        },
                                          child: SvgPicture.asset(
                                            'assets/icons/download.svg',
                                            width: 35,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Text(
                                          controller.list2[index].exams[0].examName,
                                          style: GoogleFonts.readexPro(
                                              fontSize: 18,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  controller.examScreenIndex=index;

                                  Get.toNamed(AppPath.examScreen);},
                              ),
                              controller.list2.length == index + 1
                                  ? Container()
                                  : const Divider()
                            ],
                          ),
                        ),
                      ]),
                    ):Container(),

                  ],
                ):Column(
                  children: [
                    SizedBox(height: height*0.1,),
                    TextButton(onPressed: () async {
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
                        child: Text(language?"click here to subscribe":"اضغط هنا للاشتراك",style: GoogleFonts.readexPro(fontSize: 22,fontWeight: FontWeight.w500,
                            color: AppColors.black),)),],
                )
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
