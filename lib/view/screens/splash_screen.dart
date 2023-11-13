import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/main.dart';
import 'package:welcome_screen/routes/path.dart';
import 'package:welcome_screen/view/screens/progress_details_screen.dart';

import '../../constant/app_ststic_var.dart';

class Splash_screen extends StatelessWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),

                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: SafeArea(bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                GestureDetector(
                  onTap: () {
                    print("share");
                  },
                  child: Row(
                    children: [
                      Text(
                        language?"Share":'مشاركة',
                        style: GoogleFonts.readexPro(
                            fontSize: 20, color: AppColors.white),
                      ),
                      const Text(" "),
                      SvgPicture.asset(
                        "assets/icons/share.svg",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                ),
               Container(width: width>900?width*0.25:width*0.4,height:width>900?width*0.25: width*0.4,
                 decoration:  BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                 image: const DecorationImage(
                   image: AssetImage('assets/images/app_icon.jpg')

                 )
               ),),
                SizedBox(height: height*0.02,),
                Text(language?"Let's Start Learning today!":"!لنبدأ رحلة التعلم اليوم",style: GoogleFonts.readexPro(fontWeight: FontWeight.bold,fontSize: 30,color: AppColors.white),
                textAlign: TextAlign.center,),
                SizedBox(height: height*0.01,),
                Text(language?"Join to Rehla App and Get the best education services from the best teachers":"انضم الى تطبيق رحلة واحصل على افضل خدمات التعليم عن بعد من قبل افضل المدرسين",style: GoogleFonts.readexPro(fontSize: 18,color: AppColors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                SizedBox(height: height*0.04,),
                GestureDetector(
                  onTap: (){print("sign in");
                     Get.offNamed(AppPath.login);

                    },
                  child: Container(padding: EdgeInsets.all(10),
                    width: width*0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.appWhite,),
                    child: Center(child: Text(language?"Sign in":"تسجيل الدخول",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w600),)),
                  ),
                ),
              SizedBox(height:height>1200? height*0.3:height*0.1,),
                Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap: (){print('email');},
                          child: Row(
                            children: [
                              Text(
                                language?"Email":'البريد الالكتدوني',
                                style: GoogleFonts.readexPro(
                                    fontSize: 15, color: AppColors.white),
                              ),
                              const Text(" "),
                              SvgPicture.asset(
                                "assets/icons/email.svg",
                              )
                            ],
                          ),
                        ),
                        GestureDetector(onTap: () async {print("call us");try {
                          Uri url = Uri.parse('https://wa.me/${AppStaticVar.whatsappNumberConnect}'); // Replace with your desired URL
                          if (!await launchUrl(url)) {
                        print('Could not launch $url');
                        }
                          } catch (e) {
                          print('Error: $e');
                          // Handle the error, e.g., show a message to the user
                          }},
                          child: Row(
                            children: [
                              Text(
                                language?"Contact Us":'اتصل بنا',
                                style: GoogleFonts.readexPro(
                                    fontSize: 15, color: AppColors.white),
                              ),
                              const Text(" "),
                              SvgPicture.asset(
                                "assets/icons/call.svg",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          language?"All right reserved to Rehla App 2023":'جميع الحقوق محفوظة لتطبيق رحلة 2023',
                          style: GoogleFonts.readexPro(
                              fontSize: 15, color: AppColors.white),
                        ),
                        const Text(" "),
                        SvgPicture.asset(
                          "assets/icons/copy_right.svg",
                        )
                      ],
                    ),
                    SizedBox(height: height*0.01,)

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
