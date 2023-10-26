import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_color.dart';

class SubscribeDialog extends StatelessWidget {
  const SubscribeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(elevation: 10,
      child: Container(padding: EdgeInsets.all(20),
        width: width,height: height*0.5,
        child: Column(
          children: [
            GestureDetector(onTap:(){Navigator.pop(context);},
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/icons/cancel.svg')
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(width: width,height: height*0.25,
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage('assets/images/dialog.png')
              )),),
            SizedBox(height: 10,),
            Text("يجب عليك الاشتراك اولا",style: GoogleFonts.readexPro(
                fontSize: 20,fontWeight: FontWeight.w600
            ),textDirection: TextDirection.rtl,maxLines: 1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 10,),
            Text("لضمان الوصول الى جميع المواد التعليمية و المحاضرات المتوفرة على تطبيق رحلة",style: GoogleFonts.readexPro(
                fontSize: 16,fontWeight: FontWeight.w300
            ),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: ()  {print("subscribe");},
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
                      "اشترك الان",
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
                        'assets/icons/crown.svg',
                        width: 25
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
