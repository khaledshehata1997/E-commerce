import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';


class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color? color;
  CustomButton(

  {
     this.color,
   required this.onPressed,
    this.text=''
  });
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return  Container(
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            primary: mainColor,
            fixedSize:Size(w*.8,h*.06) ,
            alignment: Alignment.center
          ),
          onPressed:(){
            onPressed();
          },
          child: Text('$text',
            style: TextStyle(

              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
