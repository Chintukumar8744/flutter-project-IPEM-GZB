import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton.dart';
import 'package:ipemnotesapp/src/common_widgets/uihelperclass.dart';
import 'package:ipemnotesapp/src/features/authentication/controllers/pdf_api.dart';
import 'package:ipemnotesapp/src/features/authentication/controllers/pdf_viewer_page.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/Semester_1.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem2/semester_2.dart';

class BCASelectSemester extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BCASelectSemesterState();
}

class _BCASelectSemesterState extends State<BCASelectSemester> {

  bool isLoading=false;
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
                child: Center(child: Text("Select Semester",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Center(child: Text("B.C.A",style: TextStyle(color: Colors.purpleAccent,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
             const SizedBox(height: 20,),
              Container(
                height:50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightGreen,
                    width: 8,
                  ),
                  color: Colors.white,
                ),
                child: InkWell(

                    onTap: ()async{
                      setState(() {
                        isLoading=true;
                      });
                      Future.delayed(Duration(seconds: 3),(){
                        setState(() {
                          isLoading=false;
                        });
                      });
                      final url='BCA.pdf';
                      final file=await PDFApi.loadFirebase(url);
                      if(file==null) return;
                      openPDF(context,file);
                    },
                    child:isLoading?CircularProgressIndicator(color: Colors.red,): Center(child: Text("Check Syllabus",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),),
             const SizedBox(
                height: 8,
              ),
              Recbutton(btnName: "Semester 1", bordercolor: Colors.red,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Semester1(),));

              },),
             const SizedBox(
                height: 8,
              ),
              Recbutton(btnName: "Semester 2", bordercolor: Colors.purpleAccent,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Semester2(),));

              }),
             const SizedBox(
                height: 8,
              ),
              Recbutton(btnName: "Semester 3", bordercolor: Colors.lightBlue,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Semester3(),));
              },),
             const SizedBox(
                height: 8,
              ),
              Recbutton(btnName: "Semester 4", bordercolor: Colors.yellowAccent,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Semester4(),));

              }),
             const SizedBox(
                height: 8,
              ),
              Recbutton(btnName: "Semester 5", bordercolor: Colors.cyanAccent,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Semester5(),));

              }),
             const SizedBox(
                height: 8,
              ),
              Recbutton(btnName: "Semester 6", bordercolor: Colors.pinkAccent,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Semester6(),));
              }),
             const SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                width: double.infinity,
                child:const Center(child: Text("\"The future is Always Beginning Now\"",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),)),
              ),
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
