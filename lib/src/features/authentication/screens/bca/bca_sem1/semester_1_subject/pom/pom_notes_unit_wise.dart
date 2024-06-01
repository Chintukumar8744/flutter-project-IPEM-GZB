import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/common_widgets/topCircleimage.dart';

class PomNotesUnitWise extends StatefulWidget {
  const PomNotesUnitWise({super.key});

  @override
  State<PomNotesUnitWise> createState() => _PomNotesUnitWiseState();
}

class _PomNotesUnitWiseState extends State<PomNotesUnitWise> {
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
                child: Row(
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
        decoration: BoxDecoration(
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
                child: Center(child: Text("Principle of Management",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              TopCircleImage("Ms. Palak Masson", "Assistant professor",Colors.blueAccent, "assets/images/img.png"),
              SizedBox(
                height: 25,
              ),
              Recbutton2(btnName: "Unit1-6", bordercolor: Colors.red,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PomNotes.pdf"),));
              },),

            ],
          ),
        ),
      ),
    );
  }
}
