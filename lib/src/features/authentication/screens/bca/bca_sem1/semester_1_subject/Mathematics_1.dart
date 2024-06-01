
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/common_widgets/rectanglebutton2.dart';
import 'package:ipemnotesapp/src/common_widgets/topCircleimage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/bca_sem1/semester_1_subject/mathematics_1/math_notes_unit_wise.dart';


class Mathematics1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Mathematics1State();
}

class _Mathematics1State extends State<Mathematics1> {
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
                child: Center(child: Text("Mathematics I",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Container(
              //     height: 100,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         color: const Color(0xff7c94b6),
              //         image: DecorationImage(
              //           image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
              //           fit: BoxFit.cover,
              //         ),
              //         borderRadius: BorderRadius.all( Radius.circular(50.0)),
              //         border: Border.all(
              //           color: Colors.green.shade300,
              //           width: 4.0,
              //         ),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.greenAccent,
              //             offset: const Offset(
              //               5.0,
              //               5.0,
              //             ),
              //             blurRadius: 10.0,
              //             spreadRadius: 2.0,
              //           ), //BoxShadow
              //           BoxShadow(
              //             color: Colors.white,
              //             offset: const Offset(0.0, 0.0),
              //             blurRadius: 0.0,
              //             spreadRadius: 0.0,
              //           ), //BoxShadow
              //         ],
              //       ),
              //     ),
              //     SizedBox(
              //       width: 50,
              //     ),
              //     Column(
              //       children: [
              //         Text("Dr.Pnakaj Agrwal"),
              //         Text("(Assostant professor)"),
              //       ],
              //     )
              //
              //   ],
              // ),
              TopCircleImage("Dr. Pankaj Agarwal", "Assistant professor",Colors.blueAccent, "assets/images/img.png"),
              SizedBox(
                height: 25,
              ),
              Recbutton2(btnName: "Notes", bordercolor: Colors.red,backgroundcolor:Colors.white,callBack: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Math_notes_unit_wise() ));
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
