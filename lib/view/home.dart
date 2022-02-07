import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_ecommerce1/widgets/bottom_nav/screen1.dart';
import 'package:project1_ecommerce1/widgets/bottom_nav/screen2.dart';
import 'package:project1_ecommerce1/widgets/bottom_nav/screen3.dart';

import 'auth/sign_in.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens=[
    Screen1(),
    Screen2(),
    Screen3()
  ];
  List<String> title=[
    'one',
    'two',
    'three',
  ];
  int index=0;
  FirebaseAuth auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (val){
         setState(() {
           index=val;
         });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Me'),
        ],
      ),
   body: screens[index]
    );
  }
}

// GetBuilder
//Getx
//Obx
