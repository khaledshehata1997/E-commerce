import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeService{
  final CollectionReference categoryCollectonRef=
  FirebaseFirestore.instance.collection('Categories');
  
  final CollectionReference productCollectionRef=
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory()async{
    var value= await categoryCollectonRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProducts()async{
    var value= await productCollectionRef.get();
    return value.docs;
  }

}