import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';
import 'package:shoes_store/home/homepage.dart';
import 'package:shoes_store/products-screen/widgets/products_tile.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.category, this.brand});

  final String? category;
  final String? brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("products").doc("basketball").
          collection("shoes").doc("adidas").collection("model").snapshots(), 
        builder: (context, snpashot) {
          if(!snpashot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            final List<ProductsData> productsList = snpashot.data!.docs.map((doc) {
              return ProductsData.fromFirestore(doc);
            }).toList();

            return GridView.builder(
              itemCount: productsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemBuilder: (context, index){

                ProductsData productsData = productsList[index];

                return ProductsTile(products: productsData,);
              }
            );
          }
        }
      ),
    );
  }
}