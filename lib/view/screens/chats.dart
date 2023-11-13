import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/main.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        right: false,left: false,bottom: false,
        child: SingleChildScrollView(
          child: Container(padding: EdgeInsets.all(10),width: width,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        language?"Chat":"الدردشة",
                        style: GoogleFonts.readexPro(fontSize: 22),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
               ...List.generate(6, (index) =>  Container(width: width,padding: EdgeInsets.all(20),
                 margin: EdgeInsets.symmetric(vertical: 10),
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.4), // Shadow color
                         blurRadius: 10.0, // Spread radius
                         spreadRadius: 2.0, // Blur radius
                         offset: Offset(4.0, 4.0), // Offset in x and y direction
                       ),],
                     image: DecorationImage(
                         image: AssetImage('assets/images/chat_back.png'),fit: BoxFit.cover
                     )

                 ),child: Column(
                   children: [
                     Row(
                       children: [
                         Text("chemistry 101",style: GoogleFonts.readexPro(fontSize: 30,
                             color: AppColors.white),),
                       ],
                     ),
                     SizedBox(height: height*0.03,),
                     Text("Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur    ",
                       style: GoogleFonts.readexPro(fontSize: 16,color: AppColors.appLightGrey),maxLines: 3,overflow:
                       TextOverflow.ellipsis,),
                     SizedBox(height: 20,),

                     Row(children: [
                       SvgPicture.asset('assets/icons/persons.svg'),
                       SizedBox(width: 6,),
                       Text("participants : 50 ",style: GoogleFonts.readexPro(fontSize: 20,color:
                       AppColors.white),)
                     ],),
                     SizedBox(height: 15,),
                     GestureDetector(
                       onTap: ()  {



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
                               "الانضمام",
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
                               'assets/icons/join.svg',
                               width: 25,color: AppColors.white,
                             )
                           ],
                         ),
                       ),
                     )

                   ],
                 ),))
              ],
            ),

          ),
        ),
      ),
    );
  }
}
