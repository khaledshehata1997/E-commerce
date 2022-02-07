import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project1_ecommerce1/model/cart_model.dart';
import 'package:project1_ecommerce1/model/category_model.dart';
import 'package:project1_ecommerce1/model/product_model.dart';
import 'package:project1_ecommerce1/services/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class CartViewModel extends GetxController{
// List<CartModel>_cartModel=[];
// List<CartModel>get cartModel=>_cartModel;
// // Get a location using getDatabasesPath
//
// CartViewModel(){
//   getAllProduct();
// }
// getAllProduct()async{
//   var dbHelper=CartDatabaseHelper();
//   _cartModel =await dbHelper.getAllProduct();
//   update();
// }
//   addProduct(CartModel cartModel)async{
//     var dbHelper=CartDatabaseHelper();
//     await dbHelper.insert(cartModel);
//    update();
//   }

CartViewModel(){
  initDb();
}

ProductModel model=ProductModel();
CartModel cartModel=CartModel();
List cart=[];
String? name,image,price;
  late Database _database;
  Future<Database> get database async{
    if(_database !=null)return _database;
    _database =await initDb();
    return _database;
  }

  initDb()async{
    cartModel.name=model.name;
    cartModel.image=model.image;
    cartModel.price=model.price;
    String path=join(await getDatabasesPath(),'CartProduct.db');
    return await openDatabase(path,version: 1,
        onCreate: (Database db,int version)async{
          await db.execute('CREATE TABLE cartProduct ('
              'name TEXT NOT NULL,image TEXT NOT NULL,price TEXT NOT NULL)'
              '');
        }
    );
  }

  Future<List<CartModel>> getAllProduct()async{
    var dbClient=await database;
    List<Map> maps=await dbClient.query('cartProduct');
    List<CartModel >list =maps.isNotEmpty?
    maps.map((product) => CartModel.fromJson(product)).toList():[];
    cart=list;
    return list;
  }
  insert(CartModel model)async{
    var dbClient =await database;
    await dbClient.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO cartProduct(name, image, price) VALUES("${cartModel.name}", "${cartModel.image}", "${cartModel.price}")');

    });
  }


  }
