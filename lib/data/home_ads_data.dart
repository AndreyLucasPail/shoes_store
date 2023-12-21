import 'package:cloud_firestore/cloud_firestore.dart';

class HomeAds{
  HomeAds({this.adidasImg1, this.jordanImg1, this.jordanImg2, this.nikeImg1,
  this.nikeImg2, this.nikeImg3});

  String? adidasImg1;
  String? nikeImg1;
  String? nikeImg2;
  String? nikeImg3;
  String? jordanImg1;
  String? jordanImg2;

  factory HomeAds.fromFireStore(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String,dynamic>;

    return HomeAds(
      adidasImg1: data["adidasImg1"],
      nikeImg1: data["nikeImg1"],
      nikeImg2: data["nikeImg2"],
      nikeImg3: data["nikeImg3"],
      jordanImg1: data["jordanImg1"],
      jordanImg2: data["jordanImg2"],
    );
  }
}