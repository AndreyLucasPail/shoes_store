import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:shoes_store/ui/home/tiles/drawer_tile.dart';
import 'package:shoes_store/ui/products/screen/products_screen.dart';

class ExpansionTileDrawer extends StatelessWidget {
  const ExpansionTileDrawer({
    super.key,
    this.text,
    this.image,
    this.category,
  });

  final String? text;
  final String? image;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: DrawerTile(
        text: text!,
        image: image,
      ),
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("products")
                .doc(category)
                .collection("shoes")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final brandList = snapshot.data!.docs;

                List<Widget> brandWidgets = brandList.map(
                  (brandName) {
                    return TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProductsScreen(
                                  category: category,
                                  brand: brandName.id,
                                )));
                      },
                      child: Text(
                        brandName.id,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                    );
                  },
                ).toList();

                return Column(
                  children: brandWidgets,
                );
              }
            }),
      ],
    );
  }
}
