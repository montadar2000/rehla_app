import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_color.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(right: false,left: false,bottom: false,
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(width: width,height: height*0.3,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/send_fail.png'))),
          ),
          SizedBox(height: height*0.07,),
          Text('حدث خطأ',style: GoogleFonts.readexPro(fontSize: 25,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
          SizedBox(height: height*0.02,),
          Text(' يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. في حال استمرار المشكلة، يُرجى التواصل مع فريق الدعم او مشرف المادة',style: GoogleFonts.readexPro(fontSize: 16,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,),
          SizedBox(height: height*0.05,),
          GestureDetector(
            onTap: () async {

              print("retry");

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
                    "اعادة المحاولة",
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
                    'assets/icons/retry.svg',
                    width: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
