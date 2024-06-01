import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/common_widgets/topCircleimage.dart';

class OrganizationBehaviorUnitWise extends StatefulWidget {
  const OrganizationBehaviorUnitWise({super.key});

  @override
  State<OrganizationBehaviorUnitWise> createState() => _OrganizationBehaviorUnitWiseState();
}

class _OrganizationBehaviorUnitWiseState extends State<OrganizationBehaviorUnitWise> {
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
                child: Center(child: Text("Organization Behavior",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              TopCircleImage("Dr. Pankaj Agarwal", "Assistant professor",Colors.blueAccent, "assets/images/img.png"),
              const SizedBox(
                height: 25,
              ),
              Recbutton2(btnName: "Unit1", bordercolor: Colors.red,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PPAUnit1.pdf") ,));
              },),
              const  SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "Unit 2", bordercolor: Colors.purpleAccent,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PPAUnit2.pdf") ,));

              }),
              const SizedBox(
                height: 18,
              ),
              Recbutton2(btnName: "Unit 3", bordercolor: Colors.lightBlue,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PPAUnit3.pdf") ,));
              },),
              const SizedBox(
                height:18,
              ),
              Recbutton2(btnName: "Unit 4", bordercolor: Colors.yellowAccent,backgroundcolor:Colors.white,callBack: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>pdfviewer("PPAUnit4.pdf") ,));

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
}
