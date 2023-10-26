import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/controller/material_controller.dart';
import 'package:welcome_screen/routes/path.dart';
import 'package:welcome_screen/view/widgets/subscribe_dialog.dart';



class MaterialScreen extends GetView<MaterialController> {
  const MaterialScreen({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "المواد التعليمية",
                    style: GoogleFonts.readexPro(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: height*0.05,),
              ...List.generate(controller.materials.length, (index) => Container(margin: EdgeInsets.symmetric(vertical: 10),
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
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Container(width: width*0.4,height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                  controller.materials[index].image
                              ),fit: BoxFit.fill)
                            ),
                          )),
                          Flexible(flex: 2,child: Text(controller.materials[index].title,style: GoogleFonts.readexPro(fontSize: 23,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,
                          maxLines: 2,)),
                        ],
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(controller.materials[index].teacherName,style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(controller.materials[index].description,
                        style: GoogleFonts.readexPro(fontSize: 18,fontWeight: FontWeight.w300),textDirection: TextDirection.rtl,maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: ()  {
                          controller.indexMaterialClicked=index;
                          print("download");
                          // showDialog<String>(
                          //     context: context,
                          //     builder: (BuildContext context) => SubscribeDialog(),
                          // );
                          Get.toNamed(AppPath.materialDetailScreen);


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
                                "تحميل المواد الخاصة بالدورة",
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
                                width: 25,color: AppColors.white,
                              )
                            ],
                          ),
                        ),
                      ),
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
