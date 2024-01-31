import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.name,
    this.email,
    this.address,
    this.cep,
    this.birthday,
    this.neighborhood,
    this.city,
    this.state,
  });

  String? name;
  String? email;
  String? address;
  String? cep;
  String? birthday;
  String? neighborhood;
  String? city;
  String? state;

  factory UserModel.fromFirestore(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      name: data["name"],
      email: data["email"],
      address: data["adress"],
      cep: data["CEP"],
      birthday: data["birthday"],
      neighborhood: data["neighborhood"],
      city: data["city"],
      state: data["state"]
    );
  }

  Map<String, dynamic> toFirestore () {
    return {
      "name" : name,
      "email" : email,
      "adress" : address,
      "CEP" : cep,
      "birthday" : birthday,
      "neighborhood" : neighborhood,
      "city": city,
      "state": state,
    };
  }
}