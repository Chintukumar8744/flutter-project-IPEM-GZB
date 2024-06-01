import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Decoration myDecor=BoxDecoration(
    borderRadius:BorderRadius.circular(20),
    gradient: LinearGradient(
        colors: [
          Color(0xff4facfe),
          Color(0xff00f2fe),
        ]
    )
);
class Roundedbutton extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final VoidCallback? callBack;
  Roundedbutton({
   required this.btnName,
    this.icon,
    this.callBack});

  @override
  Widget build(BuildContext context) {
  return Expanded(
    child: InkWell(
      onTap: (){
        callBack!();
      },
      child: Container(
        decoration: myDecor,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(
              height: 5,
            ),
            Text(btnName,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
          ],
        ),
      ),
    ),
  );
  }
}