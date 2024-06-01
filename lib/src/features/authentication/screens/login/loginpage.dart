import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipemnotesapp/src/common_widgets/uihelperclass.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/homepage/homepage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/forgotpassword.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/signupscreen/services/auth.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/signupscreen/signupscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = "", password = "";

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(()=>Homepage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }
  // TextEditingController emailcontroller=TextEditingController();
  // TextEditingController passwordcontroller=TextEditingController();
  //
  // login(String email,String password)async{
  //   if(email=="" && password==""){
  //     return Uihelper.CustomAlertBox(context, "Enter Required Field");
  //   }
  //   else{
  //     UserCredential? usercredential;
  //     try{
  //       usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
  //         Get.to(const HomePage());
  //       });
  //     }
  //     on FirebaseAuthException catch(ex){
  //       return Uihelper.CustomAlertBox(context, ex.code.toString());
  //     }
  //   }
  // }
  bool _passwordVisible = false;

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     login(email.text.toString(), passwordcontroller.text.toString());
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
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image:const  AssetImage("assets/images/loginpageimage/collagelogo.png"),
                    height: size.height * 0.3,
                  ),
                  Text("LOGIN SCREEN", style: Theme.of(context).textTheme.headlineLarge,),
                SizedBox(height: 20,),
                const Text("Welcome to LOGIN SCREEN",)
                ],
              ),
              Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(height: 10,),
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                            prefixIcon:const Icon(Icons.email),
                            prefixIconColor: Colors.blue,
                            floatingLabelStyle:const TextStyle(color: Colors.blue,fontSize: 20),
                            labelStyle: GoogleFonts.roboto(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 2.0,color: Colors.blue),
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:const BorderSide(color: Colors.blue,width: 10)
                            ),
                          ),
                          validator: _validateEmail,
                        ),
                       const SizedBox(height: 20,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            labelText: "Password",
                            prefixIcon:const Icon(Icons.password),
                            prefixIconColor: Colors.blue,
                            floatingLabelStyle:const TextStyle(color: Colors.blue,fontSize: 20),
                            labelStyle: GoogleFonts.roboto(),
                            focusedBorder:const OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0,color: Colors.blue)
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:const BorderSide(color: Colors.blue,width: 10)
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){
                              Get.to(()=>const Forgotpassword());
                            }, child:const Text("Forgot Password?",style: TextStyle(fontSize: 15,),)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,borderRadius: BorderRadius.circular(15)
                            ),
                            child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    setState(() {
                                      email= emailController.text;
                                      password=passwordController.text;
                                    });
                                  }
                                  userLogin();
                                }, child:const Text("LOGIN",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize:20 ),),
                            )),
                        Column(
                          children: [
                            const Text("OR"),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: (){
                                  AuthMethods().signInWithGoogle(context);
                                },
                                icon:const Image(image: AssetImage("assets/images/loginpageimage/google.png"),width: 20.0,),
                                label: Text("Sign in with Google"),
                              ),
                            ),
                            TextButton(onPressed: (){
                              Get.offAll(()=>SignUpScreen());
                            }, child: Text.rich(TextSpan(children: [
                              TextSpan(text: "all ready have an account?"),
                              TextSpan(text: "Signup"),
                            ])))
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
