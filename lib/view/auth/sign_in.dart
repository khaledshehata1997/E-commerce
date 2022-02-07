// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project1_ecommerce1/view/auth/sign_up.dart';
import 'package:project1_ecommerce1/view_model/auth_view_model.dart';
import 'package:project1_ecommerce1/widgets/custom_text.dart';
import 'package:project1_ecommerce1/widgets/custom_text_form.dart';
import '../../constants.dart';

class SignIn extends StatelessWidget {
  var controller=Get.put(AuthViewModel());
 GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: GetBuilder<AuthViewModel>(
            init: AuthViewModel(),
            builder:(_)=> Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height*.6,
                   margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: Colors.white,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,

                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         CustomText(
                           text: 'Welcome,',
                           size: 25,
                           isbold: true,
                         ),
                          GestureDetector(
                            onTap: (){
                              Get.to(SignUp());
                            },
                            child: CustomText(
                             text: 'Sign up',
                             isbold: true,
                              color: mainColor,
                         ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      CustomText(
                        text: 'Sign in to continue',
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(height: Get.height*.1,),
                      CustomText(
                        text: 'Email',
                        color: Colors.grey,
                        size: 16,
                        isbold: true,
                      ),

                      CustomTextForm(
                        onSave: (val){
                         controller.email=val;
                        },
                        hint: 'khaled@gmail.com',
                      )  ,
                      SizedBox(height: 30,),
                      CustomText(
                        text: 'Password',
                        color: Colors.grey,
                        size: 16,
                        isbold: true,
                      ),

                      CustomTextForm(
                        onSave: (val){
                         controller.password=val;
                        },
                        hint: '*********',
                      ),
                      SizedBox(height: 15,),
                      CustomText(
                        text: 'Forget Password?',
                        size: 16,
                        isbold: true,
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(Get.width*.8),
                          primary: mainColor,
                        ),
                        onPressed: (){
                         formKey.currentState!.save();
                         if(formKey.currentState!.validate()){
                           controller.signIn();
                         }
                        },
                        child: Text('Sign In'),
                      )
                    ],
                  ),
                ),
                CustomText(
                  text: '-OR-',
                  size: 20,
                  isbold: true,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: .8,
                                color: Colors.black
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Image.network('https://www.flaticon.com/free-icon/facebook_174848',
                          //   width: 25,
                          //   height: 25,
                          // ),
                          CustomText(
                            text: 'Sign in with facbook',
                            size: 12,
                            alignment: Alignment.center,
                          ),
                         // SizedBox(width: 5,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: (){
                      controller.googleAccount();
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: .8,
                            color: Colors.black
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Image.network('https://www.flaticon.com/free-icon/google_2702602',
                          // width: 25,
                          //   height: 25,
                          // ),
                          CustomText(
                            text: 'Sign in with google',
                            size: 12,
                            alignment: Alignment.center,
                          ),
                      //    SizedBox(width: 5,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
