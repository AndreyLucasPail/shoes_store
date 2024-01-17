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

  CartModel.fromFirestore(QueryDocumentSnapshot snapshot){
    
    cId = snapshot.id;
    category = snapshot.get("category");
    brand = snapshot.get("brand");
    productId = snapshot.get("productId");
    quantity = snapshot.get("qunatity");
    size = snapshot.get("size");
    price = snapshot.get("price");
 
  }

  Map<String, dynamic> toMap(){
    return{
      "category" : category ?? "",
      "productId" : productId ?? "",
      "brand" : brand ?? "",
      "quantity" : quantity ?? "",
      "size" : size ?? "",
      "price" : price ?? "",
      "products" : productsModel?.toFirestore() ?? "",
    };
  }

}