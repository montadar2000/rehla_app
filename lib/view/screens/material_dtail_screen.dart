import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_screen/controller/material_controller.dart';
import 'package:welcome_screen/main.dart';

import '../widgets/pdf_reader.dart';

class MaterialDetailScreen extends GetView<MaterialController> {
   MaterialDetailScreen({Key? key}) : super(key: key);

  MaterialController materialController=Get.find();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
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
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        language?"Materials":"المواد التعليمية",
                        style: GoogleFonts.readexPro(fontSize: 20),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: height*0.05,),
                Container(width: width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(materialController.materials[materialController.indexMaterialClicked].title,style: GoogleFonts.readexPro(fontSize: 22,fontWeight: FontWeight.w500),
                      textAlign: TextAlign.end,maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),
                      Text(language?"Lect. ":"الاستاذ : "+materialController.materials[materialController.indexMaterialClicked].teacherName,style: GoogleFonts.readexPro(fontSize: 22,fontWeight: FontWeight.w500),textAlign: TextAlign.end,maxLines: 2,overflow: TextOverflow.ellipsis,
                      textDirection: language?TextDirection.ltr:TextDirection.rtl,),

                    ],
                  ),
                ),
                SizedBox(height: height*0.02,),
                ...List.generate(materialController.materials[materialController.indexMaterialClicked].pdf.length, (index) => Column(
                  children: [
                    GestureDetector(onTap: (){

                      Navigator.of(context).push(MaterialPageRoute(builder: (context){

                        return PDFViewerCachedFromUrl(url: materialController.materials[materialController.indexMaterialClicked].pdf[index]['uri'],);
                      }));

                    },
                      child: Container(
                        width:width,padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/download2.svg",width: 25,),
                            SizedBox(width: 15,),
                            Text(language?"Chapter ${index+1}":"الفصل ${index+1}",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w500),
                              textDirection: language?TextDirection.ltr:TextDirection.rtl,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height*0.02,),
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
