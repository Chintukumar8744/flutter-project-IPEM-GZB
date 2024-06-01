
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ipemnotesapp/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instantce=>Get.find();

  //TextField Controller  to get  data  from TextFields
final email =TextEditingController();
final password =TextEditingController();
final username =TextEditingController();
final phoneNo=TextEditingController();

//call this  Function  from  Design & it  will do  the rest
void registerUser( String email,String password){
AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
}
}