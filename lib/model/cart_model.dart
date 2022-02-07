class CartModel{
  String? name,image,description,price;

  CartModel({this.image,this.name,this.description,this.price});

  CartModel.fromJson(map){
    name=map['name'];
    image=map['image'];
    description=map['description'];
    price=map['price'];
  }

  toJson(){
    return {
      'name':name,
      'image':image,
      'description':description,
      'price':price,
    };
  }
}