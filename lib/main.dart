import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/checkuser.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/loginpage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/signupscreen/signupscreen.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/splash_screen/splashscreen.dart';
import 'package:ipemnotesapp/src/repository/authentication_repository/authentication_repository.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}


