import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/details_contriller.dart';
import 'package:welcome_screen/controller/exam_controller.dart';
import 'package:welcome_screen/controller/exam_status_controller.dart';
import 'package:welcome_screen/routes/path.dart';
import 'package:welcome_screen/view/screens/exam_status.dart';
import 'package:welcome_screen/view/widgets/pdf_reader.dart';

import '../../constant/app_color.dart';
import '../widgets/progress_dialog.dart';

class ExamScreen extends GetView<ExamController> {
   ExamScreen({Key? key}) : super(key: key);

  DetailsController detailsController =Get.find();
  ExamStatusController examStatusController=Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(bottom: false,left: false,right: false,
            child:SingleChildScrollView(
              child: Container(width: width,padding: EdgeInsets.all(10),height: height,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                      child: GestureDetector(
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
                              "الاختبار",
                              style: GoogleFonts.readexPro(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height*0.03,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: width*0.05),
                      child: Column(
                        children: [
                          Text("قم بتحميل اسئلة الاختبار بصيغة PDF بالضغط على الزر ادناه:",style: GoogleFonts.readexPro(
                              fontSize: 17,fontWeight: FontWeight.w400
                          ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                          SizedBox(height: height*0.03,),
                          GestureDetector(
                            onTap: () async {
                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => PDFViewer(pdfPath: controller.filePath.toString()),),
                              // );

                              Navigator.of(context).push(MaterialPageRoute(builder: (context){

                                return PDFViewerCachedFromUrl(url:detailsController.list2[detailsController.examScreenIndex].exams[0].attachment );
                              }));
                              print("downloaddd");

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
                                children: [
                                  Text(
                                    "تحميل اسئلة الاختبار",
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
                                    'assets/icons/pdf.svg',
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.09,),
                          Text("رفع الاجابة",style: GoogleFonts.readexPro(
                              fontSize: 25,fontWeight: FontWeight.w400
                          ),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                          SizedBox(height: height*0.05,),
                          GetBuilder<ExamController>(builder: (controller)=>Row(
                            children: [
                              GestureDetector(
                                child:
                                Container(
                                  width: width*0.3,padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.5,color:controller.wrongFile?AppColors.appRed:  AppColors.appPurpole5),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),)
                                  ),
                                  child: Center(
                                    child: Text(controller.filePath==null?"اختر ملف":"الغاء",style: GoogleFonts.readexPro(fontSize: 16,color:controller.wrongFile?AppColors.appRed: AppColors.appPurpole5),
                                    ),
                                  ),
                                ),onTap: controller.filePath==null?(){print("upload.svg");
                                  controller.handleFileUpload();
                                  }:(){
                                  controller.filePath=null;
                                  controller.update();
                              },),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border(top: BorderSide(width: 1.5,color:controller.wrongFile?AppColors.appRed:  AppColors.appGrey),bottom: BorderSide(width: 1.5,color: controller.wrongFile?AppColors.appRed: AppColors.appGrey),right: BorderSide(width: 1.5,color:controller.wrongFile?AppColors.appRed:  AppColors.appGrey),left: BorderSide(width: 0,color: controller.wrongFile?AppColors.appRed: AppColors.appGrey),
                                      ),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),)
                                  ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GetBuilder<ExamController>(builder: (controller)=>Text(controller.filePath==null?"لم تقم باختيار ملف بعد":"تم اختيار ملف",style: GoogleFonts.readexPro(fontSize: 16,color:controller.wrongFile?AppColors.appRed:  AppColors.appGrey),

                                      ),),
                                      SizedBox(width: 5,),
                                      SvgPicture.asset('assets/icons/file.svg',color: controller.wrongFile?AppColors.appRed: AppColors.appGrey,)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),),
                          SizedBox(height: height*0.01,),
                          GetBuilder<ExamController>(builder: (controller)=>Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text('أرفق ملف. يجب ألا يتجاوز حجم ملف مستنداتك 10 ميغا بايت الصيغ المسموحة : PDF, DOC, DOCX',style: GoogleFonts.readexPro(fontSize: 12,color:controller.wrongFile?AppColors.appRed:  AppColors.appGrey),
                                  textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                              ),
                              SizedBox(width: 10,),
                              SvgPicture.asset('assets/icons/warning.svg',color: controller.wrongFile?AppColors.appRed: AppColors.appGrey,)


                            ],
                          ),),

                          SizedBox(height: height*0.15,),
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
                                      Text("الغاء ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600),),

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
                                      Text("ارسال ",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w600,color: AppColors.white),),

                                      SvgPicture.asset('assets/icons/email.svg')
                                    ],
                                  ),

                                ),
                                onTap: () async {print('send');
                                  controller.examId=detailsController.list2[detailsController.examScreenIndex].exams[0].examsId;
                                    if(controller.filePath!=null){
                                      controller.isProgress=true;
                                      controller.update();

                                        await controller.uploadFile();

                                      controller.isProgress=false;
                                      controller.update();

                                      if(controller.uploadStatus){
                                        examStatusController.status=true;
                                        Get.to(() => ExamStatus());
                                        controller.filePath=null;
                                      }
                                      else{
                                        examStatusController.status=false;
                                        Get.to(() =>  ExamStatus());

                                      }

                                      print("Sent Successfully");

                                      //when error occurred in post method try call this page
                                      //Get.to(() => const ExamStatus(status: false));
                                    }
                                    else{
                                      print("error");
                                      controller.wrongFile=true;
                                      controller.update();





                                    }


                                  },
                              )
                            ],
                          ),
                          SizedBox(height: height*0.01,),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text('في حال مواجهتك لأي مشكلة يرجى التواصل مع مشرف المادة',style: GoogleFonts.readexPro(fontSize: 13,color: AppColors.appGrey),
                                  textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                              ),
                              SizedBox(width: 10,),
                              Stack(
                                children: [
                                 Positioned(right: 4,left: 4,bottom: 4,top: 4,
                                   child:  SvgPicture.asset('assets/icons/info.svg'),),
                                  SvgPicture.asset('assets/icons/info_circle.svg'),

                                ],
                              )


                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          GetBuilder<ExamController>(builder: (controller) {
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
