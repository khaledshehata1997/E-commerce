import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_ecommerce1/constants.dart';
import 'package:project1_ecommerce1/model/cart_model.dart';
import 'package:project1_ecommerce1/model/product_model.dart';
import 'package:project1_ecommerce1/view_model/cart_view_model.dart';
import 'package:project1_ecommerce1/widgets/custom_text.dart';

class Details extends StatelessWidget {
  final controller= Get.put(CartViewModel());
  ProductModel? model;
  Details({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        onClosing: (){},
        builder: (context)=>Container(
          width: double.infinity,
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CustomText(
                    text: 'price',
                    size: 18,
                    color: Colors.grey,
                  ),
                  CustomText(
                    text: '\$ ${model!.price.toString()}',
                    size: 20,
                    color: mainColor,
                    isbold: true,
                  ),
                ],
              ),
              GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder:(_)=> GestureDetector(
                  onTap: (){
                   controller.insert(CartModel(
                     name: model!.name,
                     image: model!.image,
                     price: model!.price,
                   ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color:mainColor,
                    width: Get.width*.4,
                    height: 40,
                    child: Text('ADD',style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
         body: Column(
           children: [
             Stack(
               alignment: Alignment.centerLeft,
               children: [
                 Container(
                   width: double.infinity,
                   height: Get.height*.25,
                   color: Colors.grey.shade300,
                 child: Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Image.network(model!.image.toString()),
                 ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Icon(Icons.arrow_back_ios,color: Colors.black,),
                       CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 20,
                         child: Icon(Icons.star_border_outlined,color: Colors.black,),
                       )
                     ],
                   ),
                 )
               ],
             ),
             SizedBox(height: 15,),
             Padding(
               padding: const EdgeInsets.only(left: 15),
               child: CustomText(
                 text: model!.name.toString(),
                 size: 21,
                 isbold: true,
                 alignment: Alignment.topLeft,
               ),
             ),
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Container(
                   padding: EdgeInsets.only(top: 5),
                   child: Row(
                     children: [
                       CustomText(
                         text: 'size',
                       ), CustomText(
                         text: 'XL',
                       ),
                     ],
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.center,
                   ),
                   width: Get.width*.45,
                   height: 35,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         spreadRadius: .5,
                         color: Colors.black,
                         blurRadius: 1
                       )
                     ]
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 5),
                   child: Row(
                     children: [
                       CustomText(
                         text: 'Color',
                       ),
                       Container(
                         width: 20,
                         height: 20,
                         color: Colors.blue,
                       )
                     ],
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.center,
                   ),
                   width: Get.width*.45,
                   height: 35,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         spreadRadius: .5,
                         color: Colors.black,
                         blurRadius: 1
                       )
                     ]
                   ),
                 ),
               ],
             ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.only(left: 15),
               child: CustomText(
                 text: 'Detailes',
                 size: 21,
                 isbold: true,
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 15,top: 15),
               child: CustomText(
                 text:model!.description.toString(),
                 size: 17,
               ),
             ),
           ],
         ),
    );
  }
}
