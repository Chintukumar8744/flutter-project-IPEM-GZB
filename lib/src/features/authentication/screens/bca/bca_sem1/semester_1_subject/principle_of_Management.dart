
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/common_widgets/topCircleimage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/pom/pom_notes_unit_wise.dart';


class POMSam1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _POMSam1State();
}

class _POMSam1State extends State<POMSam1> {
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
                child: Center(child: Text("Principles of Management ",textAlign: TextAlign.center,style: TextStyle(color: Colors.deepPurple,fontSize: 28,fontWeight: FontWeight.bold,),)),
              ),

              TopCircleImage("Dr. Pankaj Agarwal", "Assistant professor",Colors.blueAccent, "assets/images/img.png"),
              SizedBox(
                height: 25,
              ),

              Recbutton2(btnName: "Notes", bordercolor: Colors.red,backgroundcolor:Colors.white,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>PomNotesUnitWise()));
              },),
              SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "Questions Bank", bordercolor: Colors.purpleAccent,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>));

              }),
              SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "Model Papers", bordercolor: Colors.lightBlue,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>));
              },),
              SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "List of Practicals", bordercolor: Colors.purpleAccent,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>));

              }),
              SizedBox(
                height:18,
              ),
              Recbutton2(btnName: "University Priviouse Year Papers", bordercolor: Colors.yellowAccent,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>,));

              }),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                width: double.infinity,
                child: Center(child: Text("\"Hmm. Coffee, Class, and new college friends.\"",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
