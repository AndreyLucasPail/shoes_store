import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  
  String? id;
  double? productsPrice;
  double? shipPrice;
  double? totalPrice;
  int? status;
  List? products;
  Timestamp? orderDate;

  OrderModel.fromFirestore(QueryDocumentSnapshot snapshot){
    id = snapshot.id;
    productsPrice = snapshot.get("productsPrice");
    shipPrice = snapshot.get("shipPrice");
    totalPrice = snapshot.get("totalPrice");
    status = snapshot.get("status") ?? 1;
    products = snapshot.get("products");
    orderDate = snapshot.get("orderDate");
  }

  Map<String, dynamic> toMap(){
    return{
      "id" : id ?? "",
      "productsPrice" : productsPrice ?? 0.0,
      "shipPrice" : shipPrice ?? 0.0,
      "totalPrice" : totalPrice ?? 0.0,
      "status" : status ?? 1,
      "products" : products ?? [],
      "orderDate" : orderDate ?? "", 
    };
  }
}