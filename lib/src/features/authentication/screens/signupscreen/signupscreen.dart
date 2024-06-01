import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipemnotesapp/src/common_widgets/uihelperclass.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/homepage/homepage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/loginpage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/signupscreen/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // String email = "", password = "", name = "";
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController =TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // @override
  // final _formkey = GlobalKey<FormState>();
  //
  // registration() async {
  //
  //   if (passwordController != null&& nameController.text!=""&& emailController.text!="") {
  //     try {
      //   UserCredential userCredential = await FirebaseAuth.instance
      //       .createUserWithEmailAndPassword(email: email, password: password);
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content:const Text(
      //         "Registered Successfully",
      //         style: TextStyle(fontSize: 20.0),
      //       )));
      //   // ignore: use_build_context_synchronously
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => HomePage()));
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //         backgroundColor: Colors.orangeAccent,
  //             content: Text(
  //               "Password Provided is too Weak",
  //               style: TextStyle(fontSize: 18.0),
  //             )));
  //       } else if (e.code == "email-already-in-use") {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: Text(
  //               "Account Already exists",
  //               style: TextStyle(fontSize: 18.0),
  //             )));
  //       }
  //     }
  //   }
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  TextEditingController firstnameController=TextEditingController();
  TextEditingController phoneNoController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  signUp(String email,String password)async{
    if(email== "" && password==""){
      Uihelper.CustomAlertBox(context, "Enter Required Fields");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Get.offAll(()=>Homepage());
        });

      }on FirebaseAuthException catch(ex){
        return Uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  Future<void> addData(String firstname,String phonenumber,String email,String password )async{
   await FirebaseFirestore.instance.collection("Users").doc(firstname).set({
      "First Name":firstname,
      "PhoneNo":phonenumber,
      "email":email,
      "password":password
    }).then((value){
      print("Data insert");
    });
 }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      signUp(emailController.text.toString(), passwordController.text.toString());
      addData(firstnameController.text.toString(), phoneNoController.text.toString(), emailController.text.toString(), passwordController.text.toString());
    }
  }

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

  String? _validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'please enter  a phone number';
    }
    if (value.length != 10) {
      return 'please enter  a 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image:const  AssetImage("assets/images/loginpageimage/collagelogo.png"),
                      height: size.height * 0.3,
                    ),
                    Text("SignUp Screen", style: Theme.of(context).textTheme.headlineLarge,),
                    SizedBox(height: 20,),
                    const Text("Welcome to sign up screen",)
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:15),
                   child: Form(
                  key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstnameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter your user name",
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        prefixIconColor: Colors.blue,
                        floatingLabelStyle: TextStyle(color: Colors.blue,fontSize: 20),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a username";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: phoneNoController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone number",
                        hintText: "Enter your Phone number",
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        prefixIconColor: Colors.blue,
                        floatingLabelStyle: TextStyle(color: Colors.blue,fontSize: 20),
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
                      validator: _validatePhoneNumber,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        labelText: "Password",
                        prefixIcon: Icon(Icons.fingerprint),
                        prefixIconColor: Colors.blue,
                        floatingLabelStyle: TextStyle(color: Colors.blue,fontSize: 20),
                        labelStyle: GoogleFonts.roboto(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(width: 2.0,color: Colors.blue)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.blue,width: 10)
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
                    SizedBox(height: 10,),
                    Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,borderRadius: BorderRadius.circular(15)
                        ),
                        child: ElevatedButton(
                          onPressed: _submitForm, child: Text("SIGN UP",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize:20 ),),
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
                          Get.offAll(()=>LoginScreen());
                        }, child: Text.rich(TextSpan(children: [
                          TextSpan(text: "all ready have an account?"),
                          TextSpan(text: "Login"),
                        ])))
                      ],
                    )
                  ],
                )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
