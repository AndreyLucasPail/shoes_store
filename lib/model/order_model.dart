import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_store/model/cart_model.dart';

class OrderModel {
  
  String? clientID;
  double? productsPrice;
  double? shipPrice;
  double? totalPrice;
  int? status;
  List<CartModel>? products;

  OrderModel.fromFirestore(QueryDocumentSnapshot snapshot){
    clientID = snapshot.get("clientID");
    productsPrice = snapshot.get("productsPrice");
    shipPrice = snapshot.get("shipPrice");
    totalPrice = snapshot.get("totalPrice");
    status = snapshot.get("status");
    products = snapshot.get("products");
  }

  Map<String, dynamic> toMap(){
    return{
      "clientID" : clientID ?? "",
      "productsPrice" : productsPrice ?? 0.0,
      "shipPrice" : shipPrice ?? 0.0,
      "totalPrice" : totalPrice ?? 0.0,
      "status" : status ?? 1,
      "products" : products ?? [], 
    };
  }
}