import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_ecommerce1/model/cart_model.dart';
import 'package:project1_ecommerce1/view_model/cart_view_model.dart';

import '../../constants.dart';
import '../custom_text.dart';

class Screen2 extends StatelessWidget {
  CartModel model=CartModel();
  List<CartModel> cart=[];
  final controller=Get.put(CartViewModel());
  @override
  Widget build(BuildContext context){
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
                    text: 'Total',
                    color: Colors.grey,

                  ),
                  CustomText(
                    text: '\$ 2500',
                    color: mainColor,
                    isbold: true,

                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor
                  ),
                  onPressed: (){},

                  child: Text('CHECKOUT',style: TextStyle(
                    color: Colors.white
                  ),))
            ],
          ),
        ),
      ),
      body: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder:(_)=> Container(
          margin: EdgeInsets.all(10),
          child: ListView.separated(
            separatorBuilder: (context,index){
             return SizedBox(height: 15,);
            },
              itemCount: controller.cart.length,
              itemBuilder: (context,index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Image.network(controller.cart[index].image.toString()),
                      width: Get.width*.4,
                      height: Get.height*.17,
                      color: Colors.grey.shade200,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '${controller.cart[index].name}',
                          size: 22,
                          isbold: true,
                        ),
                        SizedBox(height: 10,),
                        CustomText(
                          text: '\$ ${controller.cart[index].price}',
                          size: 22,
                          color:mainColor,
                          isbold: true,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 120,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Icon(Icons.remove_outlined),
                             CustomText(
                               text: '5',
                             ),
                             Icon(Icons.add),
                           ],
                          ),
                          color: Colors.grey.shade200,
                        )

                      ],
                    )
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
