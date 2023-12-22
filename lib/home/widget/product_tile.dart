import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key,});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("products").doc("basketball").collection("shoes").doc("Nike")
        .collection("model").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData && snapshot.data == null){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
          final List<ProductsData> productsList = snapshot.data!.docs.map((doc) {
          return ProductsData.fromFirestore(doc);
            }).toList();

          return SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
            
                ProductsData productsData = productsList[index];
            
                return Row(
                  children: [
                    Card(
                      elevation: 5,
                      child: SizedBox(
                        width: 180,
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [(productsData.images != null && productsData.images!.isNotEmpty ?
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(productsData.images![0])),
                                ),
                              ),
                            ) : Container()
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${productsData.name}",
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "R\$ ${productsData.price}",
                                  style: const TextStyle(fontSize: 16),
                                )
                              ),
                            ), 
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      }
    );
  }
}