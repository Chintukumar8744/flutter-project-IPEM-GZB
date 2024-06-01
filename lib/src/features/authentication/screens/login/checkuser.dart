

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/homepage/homepage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/loginpage.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }

  checkuser(){
    final user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      return  Homepage();
    }
    else{
      return const LoginScreen();
    }
  }
}
