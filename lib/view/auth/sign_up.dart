
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_ecommerce1/view_model/auth_view_model.dart';
import 'package:project1_ecommerce1/widgets/custom_button.dart';
import 'package:project1_ecommerce1/widgets/custom_text.dart';
import 'package:project1_ecommerce1/widgets/custom_text_form.dart';


class SignUp extends StatelessWidget {
  final controller =Get.put(AuthViewModel());
  GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: GetBuilder<AuthViewModel>(
              builder:(_)=> Column(
                children: [
                  SizedBox(height: 40,),
                  Container(

                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Sign Up',
                          size: 30,
                          color: Colors.black,
                          isbold: true,
                        ),

                        SizedBox(height: h*.1,),
                        CustomText(
                          text: 'Name',
                        ),
                        CustomTextForm(
                          hint: 'Khaled sallam',
                          onSave: (val){
                            controller.name=val;
                          },


                        ),
                        SizedBox(height: h*.05,),
                        CustomText(
                          text: 'Email',
                        ),
                        CustomTextForm(
                          hint: 'example@gmail.com',
                          onSave: (val) {
                            controller.email=val;
                          },

                        ),
                        SizedBox(
                          height: h * .05,
                        ),
                        CustomText(
                          text: 'Password',
                        ),
                        CustomTextForm(
                          hint: '*******',
                          onSave: (val) {
                            controller.password=val;
                          },

                        ),
                        SizedBox(height: h*.025,),

                        SizedBox(height: h*.025,),
                        CustomButton(
                          onPressed: ()async {
                            _formKey.currentState!.save();
                            if(_formKey.currentState!.validate()){
                              controller.createAccountWithEmailAndPassword();
                            }




                          },

                          text: 'SIGN Up',
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}