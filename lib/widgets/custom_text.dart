 import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  double? size;
  Color? color;
  var isbold;
  Alignment? alignment;

  CustomText({this.color=Colors.black,
    this.size=18,
    this.text,
    this.alignment=Alignment.topLeft,
    this.isbold=false});
   @override
   Widget build(BuildContext context) {
     return Container(
       alignment: alignment,
       child: Text(
         '$text',style: TextStyle(
         fontSize: size,
         fontWeight:isbold?FontWeight.bold: FontWeight.normal,
         color:color ,

       ),
       ),
     );
   }
 }
