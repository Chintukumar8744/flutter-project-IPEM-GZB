import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipemnotesapp/src/common_widgets/uihelperclass.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailController=TextEditingController();
  forgotpassword(String email)async{
    if(email==""){
      return Uihelper.CustomAlertBox(context,"Enter an Email TO Reset Password");
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  // resetPassword(String email) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //           "Password Reset Email has been sent !",
  //           style: TextStyle(fontSize: 20.0),
  //         )));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found") {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(
  //             "No user found for that email.",
  //             style: TextStyle(fontSize: 20.0),
  //           )));
  //     }
  //   }
  // }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return "Please enter your email";
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
              prefixIconColor: Colors.blue,
              floatingLabelStyle: TextStyle(color: Colors.blue,fontSize: 20),
              hintText: "Enter your email",
              labelStyle: GoogleFonts.roboto(),
              focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2.0,color: Colors.blue),
                  borderRadius: BorderRadius.circular(15.0)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.blue,width: 10)
              ),
            ),
            validator: _validateEmail,
          ),

          SizedBox(height: 20,),

          Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,borderRadius: BorderRadius.circular(15)
              ),
              child: ElevatedButton(
                onPressed:(){
                  forgotpassword(emailController.text.toString());
                } , child: Text("Reset Password",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize:20 ),),
              )),
        ],
      ),
    );
  }
}
