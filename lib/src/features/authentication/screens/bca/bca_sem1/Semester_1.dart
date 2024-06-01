
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';

import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/Mathematics_1.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/business_communication.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/computer_fundamental_&office_Automation.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/principle_of_Management.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/programming_principle&algorithm.dart';


class Semester1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Semester1State();
}

class _Semester1State extends State<Semester1> {
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
                child: Center(child: Text("Select Subject",style: TextStyle(color: Colors.purpleAccent,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Center(child: Text("Welcome Freshers..",style: TextStyle(color: Colors.red,fontSize: 25),)),
              ),

              SizedBox(
                height: 25,
              ),
              Recbutton2(btnName: "Mathematics I", bordercolor: Colors.red,backgroundcolor:Colors.cyanAccent.shade200,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Mathematics1() ));
              },),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Programming principles & Algorithm", bordercolor: Colors.purpleAccent,backgroundcolor:Colors.cyanAccent.shade200,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ppaSam1()));

              }),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Computer Fundemental & office Automation", bordercolor: Colors.lightBlue,backgroundcolor:Colors.cyanAccent.shade200,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>CFOASam1()));
              },),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Principle of Mangement", bordercolor: Colors.yellowAccent,backgroundcolor:Colors.cyanAccent.shade200,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>POMSam1(),));

              }),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Business Communication", bordercolor: Colors.cyanAccent,backgroundcolor:Colors.cyanAccent.shade200,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>BusinessCommunication(),));

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
