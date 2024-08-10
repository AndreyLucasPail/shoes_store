import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  ProductsModel({
    this.id,
    this.images,
    this.name,
    this.price,
    this.sizes,
    this.description,
    this.brand,
    this.category,
  });

  String? name;
  String? description;
  String? id;
  String? brand;
  String? category;
  double? price;
  List<String>? images;
  List<String>? sizes;

  factory ProductsModel.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ProductsModel(
      id: snapshot.id,
      name: data["name"],
      price: data["price"],
      category: data["category"] ?? "",
      brand: data["brand"] ?? "",
      description: data["description"] ?? "",
      images: data["img"] is Iterable ? List<String>.from(data["img"]) : null,
      sizes: data["size"] is Iterable ? List<String>.from(data["size"]) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (price != null) "price": price,
    };
  }
}
