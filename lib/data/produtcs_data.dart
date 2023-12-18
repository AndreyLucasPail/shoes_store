import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsData{

  String? name;
  String? category;
  String? id;
  double? price;
  List<String>? images;
  List<String>? sizes;

  ProductsData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.id;
    name = snapshot.get("name");
    price = snapshot.get("price").toDouble();
    images = List<String>.from(snapshot.get("img"));
    sizes = List<String>.from(snapshot.get("size"));
  }

  Map<String, dynamic> toMap () {
    return{
      "name" : name,
      "price" : price,
    };
  }
}