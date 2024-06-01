

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/homepage/homepage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/login/loginpage.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/signupscreen/signupscreen.dart';
import 'package:ipemnotesapp/src/repository/authentication_repository/exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance =>Get.find();


  //variables
  final _auth=FirebaseAuth.instance;
 late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser,_setInitialScreen);
  }

  _setInitialScreen(User? user){
    user==null? Get.offAll(()=>const LoginScreen()):Get.offAll(()=>Homepage());
  }

  Future<void> createUserWithEmailAndPassword(String email,String password)async{
try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value !=null?Get.offAll(()=> Homepage()):Get.to(()=>SignUpScreen());
}on FirebaseAuthException catch(e){
      final ex=SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCETPION  -${ex.message}');
      throw ex;
    }catch(_){
      const ex=SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION- ${ex.message}');
      throw ex;

}
  }


  Future<void> loginWithEmailAndPassword(String email,String password)async{
try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
}on FirebaseAuthException catch(e){
    }catch(_){}
  }


  Future<void> logout() async =>await _auth.signOut();
}