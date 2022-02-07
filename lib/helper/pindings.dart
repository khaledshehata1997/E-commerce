import 'package:get/get.dart';
import 'package:project1_ecommerce1/view_model/auth_view_model.dart';
import 'package:project1_ecommerce1/view_model/cart_view_model.dart';
import 'package:project1_ecommerce1/view_model/home_view_model.dart';

class Binings extends Bindings{
   @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}