import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:project1_ecommerce1/view/detailes.dart';
import 'package:project1_ecommerce1/view_model/home_view_model.dart';
import 'package:project1_ecommerce1/widgets/custom_text.dart';

import '../../constants.dart';

class Screen1 extends StatelessWidget {
final controller =Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: Get.height*.1,
            left: 20,right: 20),
        child: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder:(_)=> SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,size: 30,),
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: EdgeInsets.all(5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                  ),
                ),
                SizedBox(height: Get.height*.05,),
                CustomText(
                  text: 'Categories',
                  size: 20,
                  isbold: true,
                ),
                SizedBox(height: Get.height*.07,),
                Container(
                  height: Get.height*.15,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return SizedBox(width: 15,);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryModel.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          CircleAvatar(
                            child: Image.network(
                                controller.categoryModel[index].image.toString(),
                            width: 35,
                              height: 35,
                            ),
                            radius: 25,
                            backgroundColor: Colors.white,
                          ),
                          Text('${controller.categoryModel[index].name.toString()}')
                        ],
                      );
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Best Selling',
                      size: 18,
                      isbold: true,
                    ) ,CustomText(
                      text: 'See All',
                      size: 18,
                      isbold: true,
                    )
                  ],
                ),
                SizedBox(height: 30,),
                  Container(
                    height: 350,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemCount: controller.productModel.length,
                        itemBuilder: (context,index){
                          return   GestureDetector(
                            onTap: (){
                              Get.to(Details(
                                model: controller.productModel[index],
                              ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  height: 220,
                                  width: Get.width*.4,
                                  child: Image.network(
                                      controller.productModel[index].image.toString()),
                                ),
                                Text(controller.productModel[index].name.toString(),style:
                                  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                ),
                                Text(controller.productModel[index].description.toString(),style:
                                  TextStyle(fontSize: 16,color: Colors.grey),),
                                Text('\$ '+ controller.productModel[index].price.toString(),style:
                                  TextStyle(fontSize: 18,color: mainColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context ,index){
                          return SizedBox(width: 20,);
                        },
                       ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
