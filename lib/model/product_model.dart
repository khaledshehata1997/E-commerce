class ProductModel{
  String? name,image,description,price;

  ProductModel({this.image,this.name,this.description,this.price});

  ProductModel.fromJson(map){
    name=map['name'];
    image=map['image'];
    description=map['description'];
    price=map['price'];
  }
}