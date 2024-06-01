import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Recbutton2 extends StatelessWidget {
  final String btnName;
  final Color bordercolor;
  final VoidCallback? callBack;
  final Color? backgroundcolor;

  Recbutton2({
    required this.btnName, this.bordercolor=Colors.red, this.callBack,this.backgroundcolor
  }
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor,
            width: 5,
          ),
          color: backgroundcolor
      ),
      child: InkWell(
          onTap: (){
            callBack!();
          },
          child: Center(child: Text(btnName,style: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold),))),);
  }
}