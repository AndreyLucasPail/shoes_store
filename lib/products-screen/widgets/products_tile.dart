import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key, this.category, this.brand});

  final String? category;
  final String? brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("products").doc(category).
          collection("shoes").doc(brand).snapshots(), 
        builder: (context, snpashot) {
          if(!snpashot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemBuilder: (context, index){
                return Card();
              }
            );
          }
        }
      ),
    );
  }
}