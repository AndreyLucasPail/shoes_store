import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_store/model/produtc_model.dart';
import 'package:shoes_store/ui/shoes_screen/shoes_screen.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({
    super.key,
    this.category,
    this.brand,
    required this.products,
  });

  final String? category;
  final String? brand;
  final ProductsModel? products;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");

    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShoesScreen(
                product: products!,
                category: category,
                brand: brand,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        products!.images![0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "${products!.name}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "R\$ ${formatNumber.format(products!.price)}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
