import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/game_controller.dart';
import 'package:welcome_screen/main.dart';

import '../../constant/app_color.dart';
import '../../routes/path.dart';
import '../widgets/progress_dialog.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(bottom: false,right: false,left: false,
              child: Container(width: width,height: height,
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            language?"Games":"الالعاب",
                            style: GoogleFonts.readexPro(fontSize: 20),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,size: 20,)
                        ],
                      ),

                    ),
                    SizedBox(height: 20,),

                    Container(margin: EdgeInsets.symmetric(vertical: 10),
                        width: width,
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
                          Align(child: Container(width: width*0.6,height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/game_leader.png"),
                                fit: BoxFit.fill
                              )
                            ),
                          ),
                            alignment: Alignment.centerRight,),
                          Align(alignment: Alignment.centerLeft,child:
                            Container(padding: EdgeInsets.all(10),height: 180,
                                child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/golde_medl.svg"),
                                SizedBox(width: 10,),
                                Text("leaderboard",style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w400),),
                              ],
                            )),)
                        ],
                      ),


                    ),
                    SizedBox(height: 10,),
                    Container(margin: EdgeInsets.symmetric(vertical: 10),
                      width: width,
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
                          Align(child: Container(width: width*0.4,height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/game_cross.png"),
                                    fit: BoxFit.contain
                                )
                            ),
                          ),
                            alignment: Alignment.centerRight,),
                          Align(alignment: Alignment.bottomLeft,
                            child:
                          Container(padding: EdgeInsets.all(10),height: 100,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text("crosswords",style: GoogleFonts.readexPro(fontSize: 30,fontWeight: FontWeight.w400),),
                                  Text("your level: 9",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w400,
                                  color: AppColors.appGrey),),

                                ],
                              )),),
                          Align(alignment: Alignment.bottomCenter,
                            child:
                            Container(padding: EdgeInsets.all(10),height: 290,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    GestureDetector(
                                      onTap: ()  {
                                        print("play cross world");
                                        Get.toNamed(AppPath.listCrossGame);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: width,
                                        decoration: BoxDecoration(
                                          color: AppColors.appPurpole2,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "العب الان",
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
                                              'assets/icons/play_game.svg',
                                              width: 25,color: AppColors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                )),),

                        ],
                      ),


                    ),
                    SizedBox(height: 10,),
                    Container(margin: EdgeInsets.symmetric(vertical: 10),
                      width: width,
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
                          Align(child: Container(width: width*0.6,height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/game_flash.png"),
                                    fit: BoxFit.contain
                                )
                            ),
                          ),
                            alignment: Alignment.centerRight,),
                          Align(alignment: Alignment.bottomLeft,
                            child:
                            Container(padding: EdgeInsets.all(10),height: 100,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text("flashcards",style: GoogleFonts.readexPro(fontSize: 30,fontWeight: FontWeight.w400),),
                                    Text("your level: 9",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w400,
                                        color: AppColors.appGrey),),

                                  ],
                                )),),
                          Align(alignment: Alignment.bottomCenter,
                            child:
                            Container(padding: EdgeInsets.all(10),height: 290,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    GestureDetector(
                                      onTap: ()  {

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: width,
                                        decoration: BoxDecoration(
                                          color: AppColors.appPurpole2,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "العب الان",
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
                                              'assets/icons/play_game.svg',
                                              width: 25,color: AppColors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                )),),

                        ],
                      ),


                    ),

                  ],
                ),
          )),
          GetBuilder<GameController>(
              builder: (controller) {print("update");
              return controller.isProgress?Positioned(top: 0,right: 0,bottom: 0,left: 0,
                  child: ProgressDialog(width: width,height: height,)
              ):Container();
              })
        ],
      ),
    );
  }
}
