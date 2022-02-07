import 'dart:async';
import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:project1_ecommerce1/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper{

  late Database _database;
  Future<Database> get database async{
    if(_database !=null)return _database;
    _database =await initDb();
    return _database;
  }

  initDb()async{
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
    return list;
  }
  insert(CartModel model)async{
    var dbClient =await database;
    await dbClient.insert('cartProduct',
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

}