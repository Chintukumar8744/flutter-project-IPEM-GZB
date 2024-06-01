import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Recbutton extends StatelessWidget {
  final String btnName;
  final Color bordercolor;
  final VoidCallback? callBack;

  Recbutton({
    required this.btnName, this.bordercolor=Colors.red, this.callBack
}
       );

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor,
            width: 5,
          ),
        color: Colors.white
      ),
      child: InkWell(
          onTap: (){
            callBack!();
          },
          child: Center(child: Text(btnName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),);
  }
}