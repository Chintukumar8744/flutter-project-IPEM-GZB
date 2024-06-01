import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/checkuser.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
        Get.offAll(const CheckUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
                child:Column(
                  children: [
                    Image.asset("assets/images/loginpageimage/collagelogo.png"),
                    SizedBox(height: 20,),
                    Image.asset("assets/images/loginpageimage/collagelogo2.png"),
                  ],
                ),
          ),)
        ],
      ),
    );
  }
}
