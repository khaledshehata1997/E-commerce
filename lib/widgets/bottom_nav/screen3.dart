import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_text.dart';

class Screen3 extends StatelessWidget {
  var name,email,pic;
  String id=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection('Users').doc(id).snapshots(),
        builder:(context,snapShot){
          if(snapShot.hasData){
            dynamic document=snapShot.data;
            name =document['name'];
            email =document['email'];
            pic =document['pic'];
          }
          return  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 70),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('$pic'),
                      radius: 45,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 30,),
                    Column(
                      children: [
                        CustomText(
                          text: '$name',
                          size: 21,
                          isbold: true,
                        ),
                        SizedBox(height: 7,),
                        CustomText(
                          text: '$email',
                          size: 13,

                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.height*.13,),
              CustomListTile(
                  icon: Icons.edit,
                  title: 'Edit Profile'
              ),
              CustomListTile(
                  icon: Icons.location_on_outlined,
                  title: 'Shipping address'
              ),
              CustomListTile(
                  icon: Icons.history,
                  title: 'Order History'
              ),  CustomListTile(
                  icon: Icons.card_giftcard,
                  title: 'Cards'
              ), CustomListTile(
                  icon: Icons.notification_important_outlined,
                  title: 'Notification'
              ),CustomListTile(
                  icon: Icons.logout,
                  title: 'LogOut'
              ),
            ],
          );
        }
      ),
    );
  }

  Widget CustomListTile({icon,title}){
    return    ListTile(
      title: Text('$title',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold),),
      trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
      leading: Container(
        child: Icon(icon,size: 15,color: Colors.black,),
        height: 25,
        width: 25,
        color: Colors.greenAccent.shade100,
      ),
    );
  }
}
