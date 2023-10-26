import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/list_cross_game_level_controller.dart';

import '../../constant/app_color.dart';
import '../../main.dart';

class ListCrossGameLevelScreen extends GetView<ListCrossGameLeveController> {
  const ListCrossGameLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        bottom: false,left: false,right: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(language?"Cross World":"الكلمات المتقطعة",style: GoogleFonts.readexPro(
                          fontSize: 18
                      ),),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),

                ),
                SizedBox(height: 20,),
                ...List.generate(7, (index) =>  Stack(
                  children: [

                    Container(width: width,padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: AppColors.appPurpole3,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4), // Shadow color
                            blurRadius: 10.0, // Spread radius
                            spreadRadius: 2.0, // Blur radius
                            offset: Offset(4.0, 4.0), // Offset in x and y direction
                          ),],


                      ),child: Column(

                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("المرحلة الاولى",style: GoogleFonts.readexPro(fontSize: 22,
                                  color: AppColors.black),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(" متقدم",style: GoogleFonts.readexPro(fontSize: 16,color: AppColors.black),
                                textDirection: TextDirection.rtl,),
                              Text("المستوى :",style: GoogleFonts.readexPro(fontSize: 16,color: AppColors.white),
                              textDirection: TextDirection.rtl,),
                              SizedBox(width: 5,),
                              SvgPicture.asset("assets/icons/wifi.svg")
                            ],
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: ()  {
                              print("play now");
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: width*0.4,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: AppColors.appWhite,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "ابدا اللعب",
                                        style: GoogleFonts.readexPro(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black),
                                        textDirection: TextDirection.rtl,
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),),
                    Positioned(bottom: 20,right: 20,left: 20,top: 20,
                        child: SvgPicture.asset("assets/icons/bio_back.svg")),
                  ],
                ))
              ],
            ),

          ),
        ),
      ),
    );
  }
}
