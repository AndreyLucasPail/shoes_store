import 'package:flutter/material.dart';
import 'package:shoes_store/home/widget/ads_tile.dart';
import 'package:shoes_store/home/custom_drawer.dart';
import 'package:shoes_store/home/widget/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AdsTile(
                image: "assets/jordan1.png",
                width: MediaQuery.of(context).size.width,
                height: 220,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductsTile(brand: "Nike", category: "basketball",),
              ),
              AdsTile(
                image: "assets/curry.jpg",
                width: MediaQuery.of(context).size.width,
                height: 210,
              ),
              AdsTile(
                image: "assets/adidas.png",
                width: MediaQuery.of(context).size.width,
                height: 180,
              ),
              AdsTile(
                image: "assets/jordan3.jpg",
                width: MediaQuery.of(context).size.width,
                height: 450,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductsTile(category: "run", brand: "Nike",),
              ),
              AdsTile(
                image: "assets/nike4.png",
                width: MediaQuery.of(context).size.width,
                height: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }

}