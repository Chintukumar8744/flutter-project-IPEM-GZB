
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem2/semester_2_subject/c_programing.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem2/semester_2_subject/digital_electronic_&_computer_organization.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem2/semester_2_subject/financail_accounting_&_management.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem2/semester_2_subject/mathematics_2.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem2/semester_2_subject/organization_behavior.dart';

class Semester2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Semester2State();
}

class _Semester2State extends State<Semester2> {
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
                child: Center(child: Text("Select Subject",style: TextStyle(color: Colors.purpleAccent,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Center(child: Text("Attended Freshers Party or Not?",style: TextStyle(color: Colors.red,fontSize: 20),)),
              ),

              SizedBox(
                height: 25,
              ),
              Recbutton2(btnName: "Mathematics II", bordercolor: Colors.red,backgroundcolor: Colors.yellow,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Mathematics_2() ));
              },),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "C Programming", bordercolor: Colors.purpleAccent,backgroundcolor: Colors.yellow,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Cprogramming()));
              }),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Organization behavior", bordercolor: Colors.lightBlue,backgroundcolor: Colors.yellow,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>OrganizationBehavior()));
              },),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Digital Electronic & Computer Organication", bordercolor: Colors.yellowAccent,backgroundcolor: Colors.yellow,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>DigigalElectronic(),));

              }),
              SizedBox(
                height: 8,
              ),
              Recbutton2(btnName: "Financial Accounting & management", bordercolor: Colors.cyanAccent,backgroundcolor: Colors.yellow,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>FinancialAccountingAndmanagement(),));

              }),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                width: double.infinity,
                child: Center(child: Text("\"It 's Not Working, Why?\"",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),)),
              ),SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                width: double.infinity,
                child: Center(child: Text("\"It's Working Why\"",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
