import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartBloc extends BlocBase{

  UserBloc? user;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  List<CartModel> product = [];

  void addCartItem(CartModel cartProduct){
    product.add(cartProduct);

    firebase.collection("Users").doc(user!.firebaseUser!.uid).collection("cart")
      .add(cartProduct.toMap()).then((doc) {
        cartProduct.cId = doc.id;
      });
  }

}