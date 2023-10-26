import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_color.dart';


class PDFViewerCachedFromUrl extends StatefulWidget {
   const PDFViewerCachedFromUrl({Key? key, required this.url, allowSnapshotting,}) : super(key: key);

  final String url;

  @override
  State<PDFViewerCachedFromUrl> createState() => _PDFViewerCachedFromUrlState();
}

class _PDFViewerCachedFromUrlState extends State<PDFViewerCachedFromUrl> {
  int current_page=1;
  final Completer<PDFViewController> _pdfViewController =
  Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
  StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.appWhite,leading: IconButton(
       icon: Icon( Icons.arrow_back_ios,color: AppColors.black),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
        actions: [StreamBuilder<String>(
            stream: _pageCountController.stream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                String last_page='';
                for(int i=snapshot.data.toString().length-1;i>=0;i--){
                  if(snapshot.data.toString()[i]==' '){
                    break;
                  }

                  last_page=snapshot.data.toString()[i]+last_page;




                }
                return Center(child: Text("$current_page   -   $last_page  ",style: GoogleFonts.readexPro(color: AppColors.black,fontSize: 16),));
              }
              return const SizedBox();
            }),],

      ),
      body: PDF(onPageChanged: (currentPage,finalPage){
        setState(() {
          current_page=currentPage!+1;

        });


      },
        onViewCreated: (PDFViewController pdfViewController) async {print("ok");
          _pdfViewController.complete(pdfViewController);
        await Future.delayed(Duration(seconds: 1));
          final int currentPage = await pdfViewController.getCurrentPage() ?? 1;
          final int? pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
      ).cachedFromUrl(
        widget.url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),

      ),
    );
  }
}
class PDFViewer extends StatelessWidget {
  final String pdfPath;

  const PDFViewer({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
