import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  String? hint;
  var controller;
  Function onSave;
  CustomTextForm({this.hint,required this.onSave,this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      onSaved: (value){
        onSave(value);
      },
      decoration: InputDecoration(

          hintText: '$hint',
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 19,fontWeight: FontWeight.bold)
      ),
    );
  }
}
