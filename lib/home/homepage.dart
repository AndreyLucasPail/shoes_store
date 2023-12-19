import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';
import 'package:shoes_store/home/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.snapshot});

  final DocumentSnapshot? snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, futureSnapshot) {
          if(!futureSnapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            final List<ProductsData> productsList = futureSnapshot.data!.docs.map((doc){
              return ProductsData.fromFirestore(doc);
            }).toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ), 
              itemCount: productsList.length,
              itemBuilder: (context, index){
                ProductsData productsData = productsList[index];
                //productsData.category = snapshot!.id;
                return ProductsTile(products: productsData);
              },
            );
          }
        },
      ),
    );
  }
}