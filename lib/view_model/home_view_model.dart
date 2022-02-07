import 'package:get/get.dart';
import 'package:project1_ecommerce1/model/category_model.dart';
import 'package:project1_ecommerce1/model/product_model.dart';
import 'package:project1_ecommerce1/services/home_service.dart';

class HomeViewModel extends GetxController{


  List<CategoryModel> categoryModel=[];
  List<ProductModel> productModel=[];
  HomeViewModel(){
    getCategory();
    getProducts();
  }
  getCategory()async{
    HomeService().getCategory().then((value) => {
      for(int i=0;i<value.length;i++){
        categoryModel.add(CategoryModel.fromjson(value[i].data()))
      }
    });
    update();
  }
  getProducts()async{
    HomeService().getProducts().then((value) => {
      for(int i=0;i<value.length;i++){
        productModel.add(ProductModel.fromJson(value[i].data()))
      }
    });
    update();
  }
}