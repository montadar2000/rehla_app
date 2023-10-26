import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/controller/home_controller.dart';
import 'package:welcome_screen/routes/path.dart';
import 'package:welcome_screen/view/screens/materials.dart';
import 'package:welcome_screen/view/screens/progress_screen.dart';
import 'package:welcome_screen/view/widgets/try_again_dialog.dart';

import '../../main.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/subscribe_dialog.dart';
import 'courses_screen.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Scaffold(
      key: scaffoldKey,

      endDrawer:language?null: GetBuilder<HomeController>(builder: (controller)=>Drawer(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            controller.user.firstName + " "+ controller.user.lastName,
                            style: GoogleFonts.readexPro(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.user.phone,
                            style: GoogleFonts.readexPro(
                                fontSize: 15, color: AppColors.appGrey),
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Builder(
                          builder: (context) {
                            if(controller.user.photo == ""){

                              return const CircleAvatar(backgroundColor: AppColors.white,
                                  radius: 40,
                                  backgroundImage: AssetImage("assets/images/user_image.png"),

                              );}
                            else{
                              return CircleAvatar(backgroundColor: AppColors.white,
                                  radius: 40,
                                  backgroundImage:NetworkImage(controller.user.photo));

                            }

                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "ملفي الشخصي",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.string(
                          controller.personBlack,
                          width: 25,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("my profile");
                    controller.selectedIndex = 4;
                    controller.update();

                    scaffoldKey.currentState!.closeEndDrawer();
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "محفظي",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/icons/wallet.svg",
                          width: 25,
                          height: 25,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("my wallet");
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تاريخ الدفع",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/dollar.svg',
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("history");
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "الاعدادات",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/setting.svg',
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("settings");
                    Get.toNamed(AppPath.settingScreen);
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "سياسة الخصوصية",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/privcy.svg',
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("privacy");
                    Get.toNamed(AppPath.privacyScreen);
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تواصل معنا",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/phone.svg',
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("contact us");
                    Get.toNamed(AppPath.contactUs);
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تسجيل الخروج",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/icons/logout.svg",
                          width: 25,
                        )
                      ],
                    ),
                  ),
                  onTap: () async {
                    scaffoldKey.currentState!.closeEndDrawer();

                    controller.isProgress = true;
                    controller.update();
                    int statusCode = await controller.logout();
                    print("$statusCode" + " ");
                    if (statusCode == 200) {
                      Get.offAllNamed(AppPath.login);
                      controller.isProgress = false;
                      controller.update();
                    } else {
                      print("try again");
                      Get.snackbar("Error", "try again",
                          backgroundColor: AppColors.appRed,
                          snackPosition: SnackPosition.BOTTOM);
                      controller.isProgress = false;
                      controller.update();
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                SizedBox(height: height*0.25,),
                Text(
                  "جميع الحقوق محفوظة",textAlign: TextAlign.center,
                  style: GoogleFonts.readexPro(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height:20,)
              ],
            ),
          ),
        ),
      ),),
      drawer:language? GetBuilder<HomeController>(builder: (controller)=>Drawer(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Builder(
                          builder: (context) {
                            if(controller.user.photo == ""){

                              return const CircleAvatar(backgroundColor: AppColors.white,
                                radius: 35,
                                backgroundImage: AssetImage("assets/images/user_image.png"),

                              );}
                            else{
                              return CircleAvatar(backgroundColor: AppColors.white,
                                  radius: 35,
                                  backgroundImage:NetworkImage(controller.user.photo));

                            }

                          }),
                    ),

                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.user.firstName + " "+ controller.user.lastName,
                            style: GoogleFonts.readexPro(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.user.phone,
                            style: GoogleFonts.readexPro(
                                fontSize: 15, color: AppColors.appGrey),
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.string(
                        controller.personBlack,
                        width: 25,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                        "my profile",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("my profile");
                    controller.selectedIndex = 4;
                    controller.update();

                    scaffoldKey.currentState!.closeDrawer();
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset(
                        "assets/icons/wallet.svg",
                        width: 25,
                        height: 25,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                         "my wallet",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("my wallet");
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset(
                        'assets/icons/dollar.svg',
                        width: 30,
                        height: 30,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                         "Payment history",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("history");
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset(
                        'assets/icons/setting.svg',
                        width: 30,
                        height: 30,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "settings",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("settings");
                    Get.toNamed(AppPath.settingScreen);
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset(
                        'assets/icons/privcy.svg',
                        width: 30,
                        height: 30,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "privacy Policy",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("privacy");
                    Get.toNamed(AppPath.privacyScreen);
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ SvgPicture.asset(
                        'assets/icons/phone.svg',
                        width: 30,
                        height: 30,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "contact us",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("contact us");
                    Get.toNamed(AppPath.contactUs);
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset(
                        "assets/icons/logout.svg",
                        width: 25,
                      ),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "log out",
                          style: GoogleFonts.readexPro(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    scaffoldKey.currentState!.closeDrawer();

                    controller.isProgress = true;
                    controller.update();
                    int statusCode = await controller.logout();
                    print("$statusCode" + " ");
                    if (statusCode == 200) {
                      Get.offAllNamed(AppPath.login);
                      controller.isProgress = false;
                      controller.update();
                    } else {
                      print("try again");
                      Get.snackbar("Error", "try again",
                          backgroundColor: AppColors.appRed,
                          snackPosition: SnackPosition.BOTTOM);
                      controller.isProgress = false;
                      controller.update();
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                SizedBox(height: height*0.25,),
                Text(
                  "All rights reserved",textAlign: TextAlign.center,
                  style: GoogleFonts.readexPro(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height:20,)
              ],
            ),
          ),
        ),
      ),):null,
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,

            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  GetBuilder<HomeController>(
                    builder: (controller) => SingleChildScrollView(
                      child: Column(
                        children: [
                          controller.selectedIndex == 0
                              ? Container(
                                  width: width,
                                  color: AppColors.white,
                                  padding: EdgeInsets.only(
                                      right: 10,
                                      left: 10,
                                      bottom: height * 0.15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:language?MainAxisAlignment.start:
                                            MainAxisAlignment.end,
                                        children: language?[
                                          Flexible(
                                            flex: 1,
                                            child: Builder(
                                                builder: (_) {
                                                  if(controller.user.photo != "") {
                                                    return GestureDetector(
                                                      child:  CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor: AppColors.white,
                                                          backgroundImage:NetworkImage(controller.user.photo)
                                                      ),
                                                      onTap: () {
                                                        scaffoldKey
                                                            .currentState!
                                                            .openDrawer();
                                                      },
                                                    );
                                                  }
                                                  else{
                                                    return  GestureDetector(
                                                      child: CircleAvatar(backgroundColor: AppColors.white,
                                                          radius: 30,
                                                          backgroundImage: AssetImage("assets/images/user_image.png")
                                                      ),
                                                      onTap: () {
                                                        scaffoldKey.currentState!.openDrawer();
                                                      },
                                                    );

                                                  }

                                                }),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "hello, " +
                                                      "${controller.user.firstName} ${controller.user.lastName}",
                                                  style:
                                                  GoogleFonts.readexPro(
                                                      fontSize: 17,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textDirection:
                                                  TextDirection.ltr,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "let's start learning !",
                                                  style:
                                                  GoogleFonts.readexPro(
                                                      fontSize: 16,
                                                      color: AppColors
                                                          .appPurpole1),
                                                  textDirection:
                                                  TextDirection.ltr,
                                                ),
                                              ],
                                            ),
                                          ),

                                        ]:[
                                        Flexible(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "مرحبا، " +
                                                    "${controller.user.firstName} ${controller.user.lastName}",
                                                style:
                                                GoogleFonts.readexPro(
                                                    fontSize: 17,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                                overflow:
                                                TextOverflow.ellipsis,
                                                textDirection:
                                                TextDirection.rtl,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "لنبدا رحلة التعلم اليوم!",
                                                style:
                                                GoogleFonts.readexPro(
                                                    fontSize: 16,
                                                    color: AppColors
                                                        .appPurpole1),
                                                textDirection:
                                                TextDirection.rtl,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Builder(
                                              builder: (_) {
                                                if(controller.user.photo != "") {
                                                  return GestureDetector(
                                                    child:  CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor: AppColors.white,
                                                        backgroundImage:NetworkImage(controller.user.photo)
                                                    ),
                                                    onTap: () {
                                                      scaffoldKey
                                                          .currentState!
                                                          .openEndDrawer();
                                                    },
                                                  );
                                                } else{
                                                  return  GestureDetector(
                                                    child: CircleAvatar(backgroundColor: AppColors.white,
                                                        radius: 30,
                                                        backgroundImage: AssetImage("assets/images/user_image.png")
                                                    ),
                                                    onTap: () {
                                                      scaffoldKey
                                                          .currentState!
                                                          .openEndDrawer();
                                                    },
                                                  );

                                                }

                                              }),
                                        ),
                                        ],
                                      ),
                                      false?Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.04,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "الدورات الحالية",
                                                style: GoogleFonts.readexPro(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: AppColors.appWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.4),
                                                  // Shadow color
                                                  blurRadius: 10.0,
                                                  // Spread radius
                                                  spreadRadius: 2.0,
                                                  // Blur radius
                                                  offset: Offset(4.0,
                                                      4.0), // Offset in x and y direction
                                                ),
                                              ],
                                            ),
                                            width: width,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'الكيمياء',
                                                          style: GoogleFonts
                                                              .readexPro(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              fontSize: 25),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'الاستاذ حسن علي',
                                                              style: GoogleFonts.readexPro(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColors
                                                                      .appPurpole2),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            SvgPicture.asset(
                                                              'assets/icons/small_person.svg',
                                                              width: 25,
                                                              height: 25,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.03,
                                                    ),
                                                    Container(
                                                      width: width * 0.2,
                                                      height: height * 0.1,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/images/chemestry_mr.png'),
                                                              fit: BoxFit
                                                                  .contain)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "اكملت ٥٠٪ من الدورة",
                                                      style:
                                                      GoogleFonts.readexPro(
                                                          fontSize: 16,
                                                          color: AppColors
                                                              .appPurpole1),
                                                    ),
                                                    Text(
                                                      "مستوى تقدمك",
                                                      style:
                                                      GoogleFonts.readexPro(
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: width,
                                                  child: SliderTheme(
                                                    data: SliderThemeData(
                                                      thumbShape:
                                                      RoundSliderThumbShape(
                                                          enabledThumbRadius:
                                                          0.0),
                                                      // Hide the thumb
                                                      trackHeight:
                                                      10.0, // Customize the track height
                                                    ),
                                                    child: Slider(
                                                      activeColor:
                                                      AppColors.appPurpole5,
                                                      inactiveColor:
                                                      AppColors.appPurpole2,
                                                      value: 50,
                                                      onChanged: (v) {},
                                                      // Set onChanged to null to disable the slider
                                                      min: 0.0,
                                                      max: 100.0,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "٢٠ محاضرة",
                                                          style: GoogleFonts
                                                              .readexPro(
                                                              fontSize: 16,
                                                              color: AppColors
                                                                  .appPurpole1),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        SvgPicture.asset(
                                                            'assets/icons/lect.svg'),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                      child: SvgPicture.asset(
                                                        'assets/icons/play.svg',
                                                        width: 60,
                                                        height: 60,
                                                      ),
                                                      onTap: () {
                                                        print("play");
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ):Container(),
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      Row(
                                        mainAxisAlignment:language?MainAxisAlignment.start:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            language?"main sections ":"الاقسام الرئيسية",
                                            style: GoogleFonts.readexPro(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectedIndex=1;
                                              controller.update();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              width: width * 0.4,
                                              height: width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.appWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    // Shadow color
                                                    blurRadius: 10.0,
                                                    // Spread radius
                                                    spreadRadius: 2.0,
                                                    // Blur radius
                                                    offset: Offset(4.0,
                                                        4.0), // Offset in x and y direction
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    height: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/cources.png'),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  Text(
                                                    language?"courses":'الدورات',
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectedIndex = 3;
                                              controller.update();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              width: width * 0.4,
                                              height: width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.appWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    // Shadow color
                                                    blurRadius: 10.0,
                                                    // Spread radius
                                                    spreadRadius: 2.0,
                                                    // Blur radius
                                                    offset: Offset(4.0,
                                                        4.0), // Offset in x and y direction
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    height: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/progress.png'),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  Text(
                                                    language?"progress":'مستوى التقدم',
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectedIndex = 2;
                                              controller.update();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              width: width * 0.4,
                                              height: width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.appWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    // Shadow color
                                                    blurRadius: 10.0,
                                                    // Spread radius
                                                    spreadRadius: 2.0,
                                                    // Blur radius
                                                    offset: Offset(4.0,
                                                        4.0), // Offset in x and y direction
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    height: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/materials.png'),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  Text(
                                                    language?"materials":'المواد التعليمية',
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectedIndex = 4;
                                              controller.update();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              width: width * 0.4,
                                              height: width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.appWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    // Shadow color
                                                    blurRadius: 10.0,
                                                    // Spread radius
                                                    spreadRadius: 2.0,
                                                    // Blur radius
                                                    offset: Offset(4.0,
                                                        4.0), // Offset in x and y direction
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    height: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/profile.png'),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  Text(
                                                    language?"my profile":'الملف الشخصي',
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {print("chat");
                                              //Get.toNamed(AppPath.chatScreen);
                                              },
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              width: width * 0.4,
                                              height: width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.appWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    // Shadow color
                                                    blurRadius: 10.0,
                                                    // Spread radius
                                                    spreadRadius: 2.0,
                                                    // Blur radius
                                                    offset: Offset(4.0,
                                                        4.0), // Offset in x and y direction
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    height: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/chat.png'),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  Text(
                                                    language?"chatrooms":'الدردشة',
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              //Get.toNamed(AppPath.gameScreen);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              width: width * 0.4,
                                              height: width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.appWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    // Shadow color
                                                    blurRadius: 10.0,
                                                    // Spread radius
                                                    spreadRadius: 2.0,
                                                    // Blur radius
                                                    offset: Offset(4.0,
                                                        4.0), // Offset in x and y direction
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    height: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/games.png'),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  Text(
                                                    language?"games":'الالعاب',
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : controller.selectedIndex == 1
                                  ? Courses()
                                  : controller.selectedIndex == 2
                                      ? MaterialScreen()
                                      : controller.selectedIndex == 3
                                          ? ProgressScreen()
                                          : Container(
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: height * 0.1),
                                              width: width,
                                              child: (Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        child:
                                                            SvgPicture.asset(
                                                          'assets/icons/setting.svg',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                        onTap: () {
                                                          print("settings");
                                                          Get.toNamed(AppPath
                                                              .settingScreen);
                                                        },
                                                      ),
                                                      Text(
                                                        language?"my profile":"ملفي الشخصي",
                                                        style: GoogleFonts
                                                            .readexPro(
                                                                fontSize: 20),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.05,
                                                  ),
                                                  Builder(
                                                      builder: (context) {
                                                        if(controller.user.photo == ""){

                                                          return  CircleAvatar(backgroundColor: AppColors.white,
                                                            radius: 55,
                                                            backgroundImage: AssetImage("assets/images/user_image.png"),

                                                          );}
                                                        else{
                                                          return CircleAvatar(backgroundColor: AppColors.white,
                                                              radius: 55,
                                                              backgroundImage:NetworkImage(controller.user.photo));

                                                        }

                                                      }),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Text(
                                                    controller.user.firstName+" "+controller.user.lastName,
                                                    style:
                                                        GoogleFonts.readexPro(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:language?MainAxisAlignment.start:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        language?"my courses":"دوراتي",
                                                        style: GoogleFonts
                                                            .readexPro(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(AppPath
                                                          .profileCourse);
                                                    },
                                                    child: Container(
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
                                                                    'الكيمياء',
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
                                                                        'الاستاذ حسن علي',
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
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/images/chemestry_mr.png'),
                                                                        fit: BoxFit
                                                                            .contain)),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "اكملت ٥٠٪ من الدورة",
                                                                style: GoogleFonts.readexPro(
                                                                    fontSize:
                                                                        16,
                                                                    color: AppColors
                                                                        .appPurpole1),
                                                              ),
                                                              Text(
                                                                "مستوى تقدمك",
                                                                style: GoogleFonts
                                                                    .readexPro(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                            ],
                                                          ),


                                                          Container(
                                                            width: width,
                                                            child: SliderTheme(
                                                              data: SliderThemeData(
                                                                thumbShape: SliderComponentShape.noThumb,
                                                                trackHeight: 10.0, // Customize the track height
                                                              ),
                                                              child: Slider(
                                                                activeColor: AppColors.appPurpole5,
                                                                inactiveColor: AppColors.appPurpole2,
                                                                value: 50,
                                                                onChanged: (v) {
                                                                  // This callback is invoked when the slider value changes.
                                                                  // You can put your custom logic here.
                                                                },
                                                                min: 0.0,
                                                                max: 100.0,
                                                              ),
                                                            ),
                                                          ),




                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "٢٠ محاضرة",
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
                                                                  print(
                                                                      "play");
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(20),
                                                      color:
                                                          AppColors.appWhite,
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
                                                          offset: Offset(4.0,
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
                                                                  'الكيمياء',
                                                                  style: GoogleFonts.readexPro(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'الاستاذ حسن علي',
                                                                      style: GoogleFonts.readexPro(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                                              width:
                                                                  width * 0.2,
                                                              height: height *
                                                                  0.1,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/chemestry_mr.png'),
                                                                      fit: BoxFit
                                                                          .contain)),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "اكملت ٥٠٪ من الدورة",
                                                              style: GoogleFonts
                                                                  .readexPro(
                                                                      fontSize:
                                                                          16,
                                                                      color: AppColors
                                                                          .appPurpole1),
                                                            ),
                                                            Text(
                                                              "مستوى تقدمك",
                                                              style: GoogleFonts
                                                                  .readexPro(
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width: width,
                                                          child: SliderTheme(
                                                            data:
                                                                SliderThemeData(
                                                              thumbShape:SliderComponentShape.noThumb,
                                                              // Hide the thumb
                                                              trackHeight:
                                                                  10.0, // Customize the track height
                                                            ),
                                                            child: Slider(
                                                              activeColor:
                                                                  AppColors
                                                                      .appPurpole5,
                                                              inactiveColor:
                                                                  AppColors
                                                                      .appPurpole2,
                                                              value: 50,
                                                              onChanged:
                                                                  (v) {},
                                                              // Set onChanged to null to disable the slider
                                                              min: 0.0,
                                                              max: 100.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "٢٠ محاضرة",
                                                                  style: GoogleFonts.readexPro(
                                                                      fontSize:
                                                                          16,
                                                                      color: AppColors
                                                                          .appPurpole1),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                SvgPicture.asset(
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
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),




                                                  ),
                                                ],
                                              )),
                                            )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(bottom: height * 0.03),
                        width: width,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  controller.selectedIndex = 0;
                                  controller.update();
                                },






                                child: GetBuilder<HomeController>(
                                    builder: (controller) =>
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            padding: const EdgeInsets.only(
                                                top: 20),
                                            width: width * 0.15,
                                            decoration: BoxDecoration(
                                                border: controller
                                                            .selectedIndex ==
                                                        0
                                                    ? Border(
                                                        top: BorderSide(
                                                            width: 3,
                                                            color: AppColors
                                                                .appPurpole5))
                                                    : Border()),
                                            child: SvgPicture.string(
                                              controller.selectedIndex == 0
                                                  ? controller.homePurple
                                                  : controller.homeBlack,
                                              width: 25,
                                              height: 30,
                                            )))),
                            GestureDetector(
                                onTap: () {
                                  controller.selectedIndex = 1;
                                  controller.update();
                                },
                                child: GetBuilder<HomeController>(
                                    builder: (controller) =>
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            padding: const EdgeInsets.only(
                                                top: 20),
                                            width: width * 0.15,
                                            decoration: BoxDecoration(
                                                border: controller
                                                            .selectedIndex ==
                                                        1
                                                    ? Border(
                                                        top: BorderSide(
                                                            width: 3,
                                                            color: AppColors
                                                                .appPurpole5))
                                                    : Border()),
                                            child: SvgPicture.string(
                                              controller.selectedIndex == 1
                                                  ? controller.bookPurpole
                                                  : controller.bookBlack,
                                              width: 25,
                                              height: 30,
                                            )))),
                            GestureDetector(
                                onTap: () {
                                  controller.selectedIndex = 2;
                                  controller.update();
                                },
                                child: GetBuilder<HomeController>(
                                    builder: (controller) =>
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            padding: const EdgeInsets.only(
                                                top: 20),
                                            width: width * 0.15,
                                            decoration: BoxDecoration(
                                                border: controller
                                                            .selectedIndex ==
                                                        2
                                                    ? Border(
                                                        top: BorderSide(
                                                            width: 3,
                                                            color: AppColors
                                                                .appPurpole5))
                                                    : Border()),
                                            child: SvgPicture.string(
                                              controller.selectedIndex == 2
                                                  ? controller.filePurpole
                                                  : controller.fileBlack,
                                              width: 25,
                                              height: 30,
                                            )))),
                            GestureDetector(
                                onTap: () {
                                  controller.selectedIndex = 3;
                                  controller.update();
                                },
                                child: GetBuilder<HomeController>(
                                    builder: (controller) =>
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            padding: const EdgeInsets.only(
                                                top: 20),
                                            width: width * 0.15,
                                            decoration: BoxDecoration(
                                                border: controller
                                                            .selectedIndex ==
                                                        3
                                                    ? Border(
                                                        top: BorderSide(
                                                            width: 3,
                                                            color: AppColors
                                                                .appPurpole5))
                                                    : Border()),
                                            child: SvgPicture.string(
                                              controller.selectedIndex == 3
                                                  ? controller.arrowPurpole
                                                  : controller.arrowBlack,
                                              width: 25,
                                              height: 30,
                                            )))),
                            GestureDetector(
                                onTap: () {
                                  controller.selectedIndex = 4;
                                  controller.update();
                                },
                                child: GetBuilder<HomeController>(
                                    builder: (controller) =>
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            padding: const EdgeInsets.only(
                                                top: 20),
                                            width: width * 0.15,
                                            decoration: BoxDecoration(
                                                border: controller
                                                            .selectedIndex ==
                                                        4
                                                    ? Border(
                                                        top: BorderSide(
                                                            width: 3,
                                                            color: AppColors
                                                                .appPurpole5))
                                                    : Border()),
                                            child: SvgPicture.string(
                                              controller.selectedIndex == 4
                                                  ? controller.personPurpole
                                                  : controller.personBlack,
                                              width: 25,
                                              height: 30,
                                            )))),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          GetBuilder<HomeController>(builder: (controller) {
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
          // GetBuilder<HomeController>(builder: (controller) {
          //   print("update");
          //   return controller.networkStatus
          //       ? Positioned(
          //       top: height*0.3,
          //       right: width*0.1,
          //       bottom: height*0.3,
          //       left: width*0.1,
          //       child: TryAgain(
          //
          //       ))
          //       : Container();
          // }),




        ],
      ),
    );
  }
}
