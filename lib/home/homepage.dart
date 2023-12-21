import 'package:flutter/material.dart';
import 'package:shoes_store/data/home_ads_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeAds? adsImage;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          Container(
            
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("${adsImage!.adidasImg1}"))
            ),
          ),
        ],
      )
    );
  }

}