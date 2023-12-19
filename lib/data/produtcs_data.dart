import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsData{
  ProductsData({
    this.brandId,
    this.id,
    this.images,
    this.name,
    this.price,
    this.sizes
  });

  String? name;
  String? brandId;
  String? id;
  double? price;
  List<String>? images;
  List<String>? sizes;

  factory ProductsData.fromFirestore(QueryDocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return ProductsData(
      id : data["id"],
      name : data["name"],
      price : data["price"],
      images : data["img"] is Iterable ? List<String>.from(data["img"]) : null,
      sizes : data["size"] is Iterable ? List<String>.from(data["size"]) : null,
    );
  }

  Map<String, dynamic> toFirestore () {
    return{
      if(name != null) "name" : name,
      if(price != null) "price" : price,
    };
  }
}