import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:welcome_screen/controller/progress_controller.dart';
import 'package:welcome_screen/main.dart';

import '../../constant/app_color.dart';


class ProgressDetailsScreen extends GetView<ProgressControllerDetails> {
  const ProgressDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: AppColors.white,

        body: SafeArea(
          bottom: false,right: false,left: false,
          child: SingleChildScrollView(
            child: Container(width: width,
              padding: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: height*0.05),
              child: Column(
                  children: [
                    GestureDetector(onTap: (){Get.back();},
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(language?"Progress":"التقدم والدرجات",style: GoogleFonts.readexPro(fontSize: 20),),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward_ios)


                        ],
                      ),
                    ),
                SizedBox(height: height*0.02,),
                Container(padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4), // Shadow color
                        blurRadius: 10.0, // Spread radius
                        spreadRadius: 2.0, // Blur radius
                        offset: Offset(4.0, 4.0), // Offset in x and y direction
                      ),
                    ],
                    color: AppColors.appWhite,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),

                          title: ChartTitle(text: language?"Student Degree in the Course":'درجات الطالب خلال الدورة',alignment:
                          ChartAlignment.far,textStyle: GoogleFonts.readexPro(
                            fontSize: 11,fontWeight: FontWeight.w500
                          )),

                          legend: const Legend(isVisible: false,),

                          tooltipBehavior: TooltipBehavior(enable: false),
                          series: <ChartSeries<SalesData, String>>[

                            SplineSeries(dataSource: controller.data, xValueMapper: (SalesData sales, _) => sales.year, yValueMapper: (SalesData sales, _) => sales.sales,
                              splineType: SplineType.cardinal,color: AppColors.appPurpole5

                            ) ]
                      ),
                      SizedBox(height: height*0.01,),
                      Container(padding: EdgeInsets.only(left: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(width: 8,height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: AppColors.appPurpole5
                            ),),
                            SizedBox(width: 10,),
                            Text(language?"grade":"الدرجات",style: GoogleFonts.readexPro(
                              fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.black
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height*0.04,),
                Container(width: width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(language?"Progress Level":"مستوى تقدمك",style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w500),),
                      Text(language?"You Finished ${controller.progressScreenController.progress}% From Course, Keep Going":"لقد اكملت ${controller.progressScreenController.progress}% من الدورة ، ثابر على العمل الجيد!",style: GoogleFonts.readexPro(
                        fontSize: 16,fontWeight: FontWeight.w300,color: AppColors.appGrey
                      ),textDirection: TextDirection.rtl,)
                    ],
                  ),
                ),
                Container(width: width,
                  child: SliderTheme(
                    data:  SliderThemeData(

                      thumbShape: SliderComponentShape.noThumb,
                      trackHeight: 10.0, // Customize the track height

                    ),
                    child: Slider(activeColor: AppColors.appPurpole5,
                      inactiveColor: AppColors.appPurpole2,
                      value: double.parse(controller.progressScreenController.progress),
                      onChanged: (v){}, // Set onChanged to null to disable the slider
                      min: 0.0,
                      max: 100.0,
                    ),
                  ),),
                    SizedBox(height: height*0.02,),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(language?"Details and Degrees of Exams":"تفاصيل و درجات الامتحانات",style: GoogleFonts.readexPro(
                          fontSize: 20,fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    Container(padding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4), // Shadow color
                              blurRadius: 10.0, // Spread radius
                              spreadRadius: 2.0, // Blur radius
                              offset: Offset(5.0, 5.0), // Offset in x and y direction
                            ),
                          ],
                          color: AppColors.appWhite,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft:
                          Radius.circular(10))
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(language?"Notes":"الملاحظات",style: GoogleFonts.readexPro(
                                fontSize: 16,fontWeight: FontWeight.w400
                            ),textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,),
                            width: width*0.22,),
                          Container(
                            child: Text(language?"Degree":"الدرجة",style: GoogleFonts.readexPro(
                                fontSize: 16,fontWeight: FontWeight.w400
                            ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                            width: width*0.22,),
                          Container(
                            child: Text(language?"Date":"التاريخ",style: GoogleFonts.readexPro(
                                fontSize: 16,fontWeight: FontWeight.w400
                            ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                            width: width*0.22,),
                          Container(
                            child: Text(language?"Exam Name":"اسم الامتحان",style: GoogleFonts.readexPro(
                                fontSize: 16,fontWeight: FontWeight.w400
                            ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                            width: width*0.22,),
                        ],
                      ),
                    ),


                    ...List.generate(controller.progressScreenController.data.length, (index) {
                      return Column(
                        children: [

                          Container(padding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                          decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4), // Shadow color
                                blurRadius: 10.0, // Spread radius
                                spreadRadius: 2.0, // Blur radius
                                offset: Offset(5.0, 5.0), // Offset in x and y direction
                              ),
                            ],
                            color: AppColors.white,
                            borderRadius: controller.examsList.length==index+1?BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)):BorderRadius.circular(0)

                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(controller.examsList[index].note,style: GoogleFonts.readexPro(
                                    fontSize: 16,fontWeight: FontWeight.w400
                                ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                                width: width*0.22,),
                              Container(
                                child: Text("${controller.examsList[index].degree}",style: GoogleFonts.readexPro(
                                    fontSize: 16,fontWeight: FontWeight.w400,
                                  color: controller.examsList[index].degree>=90?AppColors.green:controller.examsList[index].degree>50?AppColors.appYellow:AppColors.appRed
                                ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                                width: width*0.22,),
                              Container(
                                child: Text(controller.examsList[index].date,style: GoogleFonts.readexPro(
                                    fontSize: 16,fontWeight: FontWeight.w400
                                ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                                width: width*0.22,),
                              Container(
                                child: Text(controller.examsList[index].name,style: GoogleFonts.readexPro(
                                    fontSize: 16,fontWeight: FontWeight.w400
                                ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                                width: width*0.22,),
                            ],
                          ),
                    ),
                        ],
                      );
                    },
                    ),
                    
                    // SizedBox(height: height*0.05,),
                    // Container(width: width,
                    //   padding: EdgeInsets.all(20),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(width: 2)
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Row(mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Flexible(
                    //             child: Text("تصدير الدرجات بصيغة PDF",style: GoogleFonts.readexPro(
                    //               fontSize: 20,fontWeight: FontWeight.w500,
                    //             ),textDirection: TextDirection.rtl,),
                    //           ),
                    //         ],
                    //       ),
                    //       SizedBox(height: 10,),
                    //       Text("لسهولة المشاركة وحفظ السجلات والدرجات الخاصة بك، قم بتصدير البيانات الى صيغة PDF وتحميلها على جهازك.",
                    //       style: GoogleFonts.readexPro(
                    //         fontSize: 18,fontWeight: FontWeight.w300
                    //       ),textDirection: TextDirection.rtl,),
                    //       SizedBox(height: height*0.02,),
                    //       GestureDetector(
                    //         onTap: () async {
                    //           print(controller.homeController.coursesController.availableCourses[controller.homeController.coursesController.indexCourseClickedForProgress].title);
                    //           createPDF(studentName: controller.homeController.user.firstName+" "+controller.homeController.user.lastName,
                    //               lectName: controller.homeController.coursesController.availableCourses[controller.homeController.coursesController.indexCourseClickedForProgress].title,
                    //           lecture:controller.homeController.coursesController.availableCourses[controller.homeController.coursesController.indexCourseClickedForProgress].teacherName ,
                    //           table: controller.examsList);
                    //           print("download marks");
                    //
                    //         },
                    //         child: Container(
                    //           padding: const EdgeInsets.all(15),
                    //           width: width,
                    //           decoration: BoxDecoration(
                    //             color: AppColors.appPurpole2,
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(
                    //                 "تصدير و تحميل البيانات",
                    //                 style: GoogleFonts.readexPro(
                    //                     fontSize: 17,
                    //                     fontWeight: FontWeight.w400,
                    //                     color: AppColors.white),
                    //                 textDirection: TextDirection.rtl,
                    //               ),
                    //               const SizedBox(
                    //                 width: 5,
                    //               ),
                    //               SvgPicture.asset(
                    //                 'assets/icons/pdf.svg',
                    //                 color: AppColors.white,                              width: 20,
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // )




                  ]),
            ),
          ),
        ));
  }
}



