import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/home/widget/drawer_tile.dart';

class ExpansionTileDrawer extends StatelessWidget {
  const ExpansionTileDrawer({super.key,});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const DrawerTile(
        text: "Basquete",
        image: "assets/bola-de-basquete.png",
      ),
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("products").doc("basketball").
            collection("shoes").snapshots(), 
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{

              final brandList = snapshot.data!.docs;

              List<Widget> brandWidgets = brandList.map((brandName) {
                return TextButton(
                    onPressed: (){}, 
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
          }
        ),
      ],
    );
  }
}