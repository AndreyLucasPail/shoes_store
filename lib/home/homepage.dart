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
      appBar: AppBar(
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection("products").doc("basketball").get(),
        builder: (context, futureSnapshot) {
          if(!futureSnapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ), 
              itemCount: futureSnapshot.data!.docs.length,
              itemBuilder: (context, index){
                ProductsData productsData = ProductsData.fromDocument(futureSnapshot.data!.docs[index]);
                productsData.category = snapshot!.id;
                return ProductsTile(products: productsData,);
              },
            );
          }
        },
      ),
    );
  }
}