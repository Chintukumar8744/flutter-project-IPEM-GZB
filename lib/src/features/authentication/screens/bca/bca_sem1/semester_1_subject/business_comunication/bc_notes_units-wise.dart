import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/common_widgets/topCircleimage.dart';
import 'package:ipemnotesapp/src/features/authentication/controllers/pdf_api.dart';
import 'package:ipemnotesapp/src/features/authentication/controllers/pdf_viewer_page.dart';

class BC_Notes_Unit_wise extends StatefulWidget {
  const BC_Notes_Unit_wise({super.key});

  @override
  State<BC_Notes_Unit_wise> createState() => _BC_Notes_Unit_wiseState();
}

class _BC_Notes_Unit_wiseState extends State<BC_Notes_Unit_wise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
          title: const Text(
            'IPEM NOTES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child:const Row(
                  children: [
                    Icon(
                      Icons.phone_callback_rounded,
                      color: Colors.red,
                    ),
                    // Text(""),
                  ],
                ))
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0XFFf6d365), Color(0XFFfda085)])),
          )),
      body: Container(
        height: double.infinity,
        decoration:const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xfffdcbf1),
                  Color(0xffe6dee9),
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Center(child: Text("Mathematics I",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              TopCircleImage("Dr. Pankaj Agarwal", "Assistant professor",Colors.blueAccent, "assets/images/img.png"),
              const SizedBox(
                height: 25,
              ),
              Recbutton2(btnName: "Unit1", bordercolor: Colors.red,backgroundcolor:Colors.white,callBack: ()async{
                final url='BCA/Semester_1/Business_communication/Notes/Unit-1.pdf';
                final file=await PDFApi.loadFirebase(url);
                if(file==null) return;
                openPDF(context,file);
              },),
              const  SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "Unit 2", bordercolor: Colors.purpleAccent,backgroundcolor:Colors.white,callBack: ()async{
                final url='BCA/Semester_1/Business_communication/Notes/Unit-2.pdf';
                final file=await PDFApi.loadFirebase(url);
                if(file==null) return;
                openPDF(context,file);
              }),
              const SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "Unit 3", bordercolor: Colors.lightBlue,backgroundcolor:Colors.white,callBack: ()async{
                final url='BCA/Semester_1/Business_communication/Notes/Unit-3.pdf';
                final file=await PDFApi.loadFirebase(url);
                if(file==null) return;
                openPDF(context,file);
              },),
              const SizedBox(
                height:18,
              ),
              Recbutton2(btnName: "Unit 4", bordercolor: Colors.yellowAccent,backgroundcolor:Colors.white,callBack: ()async{
                final url='BCA/Semester_1/Business_communication/Notes/Unit-4.pdf';
                final file=await PDFApi.loadFirebase(url);
                if(file==null) return;
                openPDF(context,file);
              }),
              const SizedBox(
                height: 20,
              ),
              Recbutton2(btnName: "Unit 5", bordercolor: Colors.green,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PPAUnit5.pdf") ,));

              }),
              const  SizedBox(
                height: 20,
              ),
              Recbutton2(btnName: "Unit 6", bordercolor: Colors.redAccent,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PPAUnit6.pdf") ,));

              }),
            ],
          ),
        ),
      ),
    );
  }
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,)),
  );
}
