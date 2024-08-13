import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shoes_store/model/produtc_model.dart';
import 'package:shoes_store/ui/shoes_screen/shoes_screen.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({
    super.key,
    this.category,
    this.brand,
  });

  final String? category;
  final String? brand;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");

    return FutureBuilder<List<DocumentSnapshot>>(
      future: getRandomProducts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData && snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final List<ProductsModel> productsList = snapshot.data!.map((doc) {
            return ProductsModel.fromFirestore(doc);
          }).toList();

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              ProductsModel productsData = productsList[index];

              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ShoesScreen.tag,
                        arguments: ShoesScreenArgs(
                          brand: productsData.brand,
                          category: productsData.category,
                          product: productsData,
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            productsData.images != null &&
                                    productsData.images!.isNotEmpty
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            productsData.images![0],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Align(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "${productsData.name}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 6.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "R\$ ${formatNumber.format(productsData.price)}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: CustomColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  Future<List<DocumentSnapshot>> getRandomProducts() async {
    Stream<QuerySnapshot<Map<String, dynamic>>> nike = FirebaseFirestore
        .instance
        .collection("products")
        .doc("basketball")
        .collection("shoes")
        .doc("Nike")
        .collection("model")
        .snapshots();
    Stream<QuerySnapshot<Map<String, dynamic>>> adidas = FirebaseFirestore
        .instance
        .collection("products")
        .doc("basketball")
        .collection("shoes")
        .doc("adidas")
        .collection("model")
        .snapshots();
    Stream<QuerySnapshot<Map<String, dynamic>>> jordan = FirebaseFirestore
        .instance
        .collection("products")
        .doc("basketball")
        .collection("shoes")
        .doc("jordan")
        .collection("model")
        .snapshots();
    Stream<QuerySnapshot<Map<String, dynamic>>> underArmour = FirebaseFirestore
        .instance
        .collection("products")
        .doc("basketball")
        .collection("shoes")
        .doc("anderArmour")
        .collection("model")
        .snapshots();

    final combinedStream = Rx.combineLatest4(
      nike,
      adidas,
      jordan,
      underArmour,
      (
        QuerySnapshot nikeSnap,
        QuerySnapshot adidasSnap,
        QuerySnapshot jordanSnap,
        QuerySnapshot underArmourSnap,
      ) {
        return [
          ...nikeSnap.docs,
          ...adidasSnap.docs,
          ...jordanSnap.docs,
          ...underArmourSnap.docs,
        ];
      },
    );

    List<DocumentSnapshot>? docs = await combinedStream.first;

    docs.shuffle(Random());
    List<DocumentSnapshot> randomList = docs.take(10).toList();

    return randomList;
  }
}
