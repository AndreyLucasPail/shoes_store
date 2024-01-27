import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/model/produtc_model.dart';
import 'package:shoes_store/home/widget/custom_drawer.dart';
import 'package:shoes_store/home/screens/homepage.dart';
import 'package:shoes_store/products/tiles/products_tile.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, this.category, this.brand});

  final String? category;
  final String? brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        centerTitle: true,
        title: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage())
            );
          },
          child: const Text("SNKRS"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("products").doc(category).
          collection("shoes").doc(brand).collection("model").snapshots(), 
        builder: (context, snpashot) {
          if(!snpashot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            final List<ProductsModel> productsList = snpashot.data!.docs.map((doc) {
              return ProductsModel.fromFirestore(doc);
            }).toList();

            return GridView.builder(
              itemCount: productsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8), 
              itemBuilder: (context, index){
            
                ProductsModel productData = productsList[index];
            
                return ProductsTile(products: productData, category: category, brand: brand,);
              }
            );
          }
        }
      ),
    );
  }
}