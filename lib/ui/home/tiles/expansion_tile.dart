import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/ui/products/products_screen.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

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
      title: drawerTile(),
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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                            category: category,
                            brand: brandName.id,
                          ),
                        ),
                      );
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
          },
        ),
      ],
    );
  }

  Widget drawerTile() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 1, 5),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.transparent,
                child: Image.asset(image!),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text!,
                style: const TextStyle(
                  color: CustomColors.black,
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
