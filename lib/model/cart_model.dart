import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_store/model/produtc_model.dart';

class CartModel{
  CartModel();

  String? cId;
  String? category;
  String? brand;
  String? productId;
  int? quantity;
  String? size;
  double? price;
  ProductsModel? productsModel;
  String? imgCart;
  String? model;

  CartModel.fromFirestore(QueryDocumentSnapshot snapshot){
    
    cId = snapshot.id;
    category = snapshot.get("category");
    brand = snapshot.get("brand");
    productId = snapshot.get("productId");
    quantity = snapshot.get("quantity");
    size = snapshot.get("size");
    price = snapshot.get("price");
    imgCart = snapshot.get("imgCart");
    model = snapshot.get("model");
  }

  Map<String, dynamic> toMap(){
    return{
      "category" : category ?? "",
      "productId" : productId ?? "",
      "brand" : brand ?? "",
      "quantity" : quantity ?? 0,
      "size" : size ?? "",
      "price" : price ?? 0.0,
      "products" : productsModel?.toFirestore() ?? "",
      "imgCart" : imgCart ?? "",
      "model" : model ?? "",
    };
  }

}