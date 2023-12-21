import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/data/home_ads_data.dart';

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
      drawer: const Drawer(),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("homePage").doc("homePageImg").snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData || snapshot.data == null){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                final listAds = HomeAds.fromFireStore(snapshot.data as DocumentSnapshot<Map<String, dynamic>>);
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("${listAds.adidasImg1}"))
                  ),
                );
              }
            }
          ),
        ],
      )
    );
  }

}