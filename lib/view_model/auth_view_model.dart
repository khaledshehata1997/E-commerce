import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project1_ecommerce1/view/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthViewModel extends GetxController{
  late String name ,email,password,pic,uid;
  FirebaseAuth _auth =FirebaseAuth.instance;
 CollectionReference users=FirebaseFirestore.instance.collection('Users');
 Rxn<User> _user=Rxn<User>();
 get user=>_user.value!.email;

GoogleSignIn googleSignIn =GoogleSignIn(scopes: ['email']);

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((value) async{
        if(value.user!.uid !=null){
          await users.doc(
              value.user!.uid).set({
            "name": name,
            "email": email,
            "uid": value.user!.uid,
            "pic": '',
          }
          );
        }
      });
      Get.offAll(Home());

    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  signIn()async{
   try{
     await _auth.signInWithEmailAndPassword(
         email: email,
         password: password);
     Get.to(Home());
   }
   catch(e){
     Get.snackbar('error', e.toString());
   }
  }
  void googleAccount()async{
    await googleSignIn.signIn();
    Get.to(Home());
  }
}
//gradlew signingReport