import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/controller/language_change.dart';
import 'package:welcome_screen/main.dart';

class LanguageChange extends GetView<LanguageChangeController> {
  const LanguageChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        width: width,height: height,
        child: Center(
          child: Text(language?"Language will be change...":"سيتم تغيير اللغة...",
          style: GoogleFonts.readexPro(fontSize: 18,color: AppColors.white),textDirection: language?TextDirection.ltr:TextDirection.rtl,),
        ),
      ),
    );
  }
}
