import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/model/produtc_model.dart';
import 'package:shoes_store/widgets/custom_drawer.dart';
import 'package:shoes_store/ui/home/homepage.dart';
import 'package:shoes_store/ui/products/tiles/products_tile.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class ProductsScreenArgs {
  ProductsScreenArgs({
    required this.brand,
    required this.category,
  });

  String? category;
  String? brand;
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
    required this.category,
    required this.brand,
  });

  static const tag = "/productsScreen";

  final String? category;
  final String? brand;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      appBar: appBar(),
      drawer: const CustomDrawer(),
      body: body(),
    );
  }

  Widget body() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("products")
          .doc(widget.category)
          .collection("shoes")
          .doc(widget.brand)
          .collection("model")
          .snapshots(),
      builder: (context, snpashot) {
        if (!snpashot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final List<ProductsModel> productsList =
              snpashot.data!.docs.map((doc) {
            return ProductsModel.fromFirestore(doc);
          }).toList();

          return GridView.builder(
            itemCount: productsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              ProductsModel productData = productsList[index];

              return ProductsTile(
                products: productData,
                category: widget.category,
                brand: widget.brand,
              );
            },
          );
        }
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: CustomColors.white),
      backgroundColor: CustomColors.midNigthBlue,
      centerTitle: true,
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, HomePage.tag);
        },
        child: const Text(
          "SNKRS",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
