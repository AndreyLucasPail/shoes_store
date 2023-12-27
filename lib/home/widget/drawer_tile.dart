import 'package:flutter/material.dart';
import 'package:shoes_store/products-screen/products_screen.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, this.image, this.text, this.category, this.brand,});

  final String? image;
  final String? text;
  final String? category;
  final String? brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ProductsScreen(category: category,))
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 1, 5),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  color: Colors.transparent,
                  child: Image.asset(image!),
                ),
                const SizedBox(width: 10,),
                Text(
                  text!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}