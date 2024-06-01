import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopCircleImage extends StatelessWidget{
  final String techername;
  final String rolle;
  final String imagelink;
  final Color bordercolor;

  TopCircleImage(
      this.techername, this.rolle, this.bordercolor,this.imagelink);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: AssetImage(imagelink),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all( Radius.circular(50.0)),
            border: Border.all(
              color: bordercolor,
              width: 4.0,
            ),
            boxShadow: [
              BoxShadow(
                color: bordercolor,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(techername,style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),),
            Text("($rolle)",style: TextStyle(fontSize: 15,color: Colors.purpleAccent,fontWeight: FontWeight.bold),),
          ],
        )

      ],
    );
  }


}