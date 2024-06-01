import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Aboutus extends StatefulWidget{
  @override
  _Aboutusstate createState()=> _Aboutusstate();

}

class _Aboutusstate extends  State<Aboutus>{
  @override
  Widget build(BuildContext context){
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
       width: double.infinity,
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
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: Text("❤ About US ❤",textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("IPEM Group, under the aegis of Laksh Educational Society, registered under the Societies Act, 1860, continues to build on its reputation as a premier Group of Institutions. At IPEM, we envision a world where your future comes first and we lead with different programs in the areas of Management, Information Technology, Law and Education. \n UG programs at IPEM, BBA, BCA, B.Com(H) are affiliated to Chaudhary Charan Singh University, Meerut. The B.Ed program is approved by NCTE, Ministry of HRD. PG programs, Masters of Business Administration (MBA) and Master of Computer Applications (MCA) Program are approved by the All India Council for Technical Education (AICTE) and affiliated with Abdul Kalam Technical University (AKTU), Lucknow.",textAlign: TextAlign.justify
                      ,style: TextStyle(fontSize: 18,color: Colors.purpleAccent,fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text("👇Follow us on IPEM COllage👇",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("🖼 IPEM Gallery",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            onTap: (){
                              launchUrlString("https://law.ipemgzb.ac.in/gallery/");
                            },
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      //action code when clicked
                      print("The icon is clicked");
                    },
                  ),
                )
              ],
            ),
          ),
      ),

    );
  }



}