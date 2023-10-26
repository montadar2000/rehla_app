import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_color.dart';
import '../../routes/path.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        bottom: false,left: false,right: false,
        child: SingleChildScrollView(
          child: Container( padding: EdgeInsets.only(top: 10,right: 10,left: 10,
              bottom: height*0.05),
            width: width,
            child: Column(
              children: [
                GestureDetector(onTap: (){Get.back();},
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text("ملفي الشخصي",style: GoogleFonts.readexPro(fontSize: 20),),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                SizedBox(height: height*0.08,),
                Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  Text("تاريخ الدفع",style: GoogleFonts.readexPro(fontSize: 20,fontWeight: FontWeight.w600),)
                ],),
                SizedBox(height: height*0.03,),
                Container(padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.appWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4), // Shadow color
                        blurRadius: 10.0, // Spread radius
                        spreadRadius: 2.0, // Blur radius
                        offset: Offset(4.0, 4.0), // Offset in x and y direction
                      ),
                    ],
                  ),
                  width: width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('الكيمياء',style: GoogleFonts.readexPro(fontWeight: FontWeight.w600,fontSize: 25),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('الاستاذ حسن علي',style: GoogleFonts.readexPro(fontSize: 20,fontWeight:FontWeight.w500,color: AppColors.appPurpole2),)
                                  ,
                                  SizedBox(width: 5,),
                                  SvgPicture.asset('assets/icons/small_person.svg',width: 25,height: 25,),
                                ],
                              ),



                            ],
                          ),
                          SizedBox(width: width*0.03,),
                          Container(width: width*0.2,height: height*0.1,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/chemestry_mr.png'),
                                    fit: BoxFit.contain)

                            ),),



                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(width: width*0.6,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$200",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text("10/10/2024",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text("\$0.00",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("الرصيد المدفوع",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text("تاريخ الدفع",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text("الرصيد المستحق",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(height: height*0.03,),
                Container(padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.appWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4), // Shadow color
                        blurRadius: 10.0, // Spread radius
                        spreadRadius: 2.0, // Blur radius
                        offset: Offset(4.0, 4.0), // Offset in x and y direction
                      ),
                    ],
                  ),
                  width: width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('الكيمياء',style: GoogleFonts.readexPro(fontWeight: FontWeight.w600,fontSize: 25),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('الاستاذ حسن علي',style: GoogleFonts.readexPro(fontSize: 20,fontWeight:FontWeight.w500,color: AppColors.appPurpole2),)
                                  ,
                                  SizedBox(width: 5,),
                                  SvgPicture.asset('assets/icons/small_person.svg',width: 25,height: 25,),
                                ],
                              ),



                            ],
                          ),
                          SizedBox(width: width*0.03,),
                          Container(width: width*0.2,height: height*0.1,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/chemestry_mr.png'),
                                    fit: BoxFit.contain)

                            ),),



                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(width: width*0.6,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$200",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text("10/10/2024",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text("\$0.00",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("الرصيد المدفوع",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text("تاريخ الدفع",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text("الرصيد المستحق",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      GestureDetector(
                        onTap: () async {
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => PDFViewer(pdfPath: controller.filePath.toString()),),
                          // );
                          print("pay");

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
                                "دفع الرصيد المستحق",
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
                                'assets/icons/warning.svg',
color: AppColors.white,                              width: 20,
                              )
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: height*0.03,),
                Container(padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.appWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4), // Shadow color
                        blurRadius: 10.0, // Spread radius
                        spreadRadius: 2.0, // Blur radius
                        offset: Offset(4.0, 4.0), // Offset in x and y direction
                      ),
                    ],
                  ),
                  width: width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('الكيمياء',style: GoogleFonts.readexPro(fontWeight: FontWeight.w600,fontSize: 25),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('الاستاذ حسن علي',style: GoogleFonts.readexPro(fontSize: 20,fontWeight:FontWeight.w500,color: AppColors.appPurpole2),)
                                  ,
                                  SizedBox(width: 5,),
                                  SvgPicture.asset('assets/icons/small_person.svg',width: 25,height: 25,),
                                ],
                              ),



                            ],
                          ),
                          SizedBox(width: width*0.03,),
                          Container(width: width*0.2,height: height*0.1,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/chemestry_mr.png'),
                                    fit: BoxFit.contain)

                            ),),



                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(width: width*0.6,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$200",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text("10/10/2024",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text("\$0.00",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text(":",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("الرصيد المدفوع",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),
                                Text("تاريخ الدفع",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,),
                                SizedBox(height: 5,),

                                Text("الرصيد المستحق",style: GoogleFonts.readexPro(fontSize: 17,fontWeight: FontWeight.w400),textDirection: TextDirection.rtl,)
                              ],
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
