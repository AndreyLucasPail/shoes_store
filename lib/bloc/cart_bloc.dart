import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartBloc extends BlocBase{
  
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  List<CartModel> product = [];
  UserBloc? user;

  final cartController = BehaviorSubject<List<CartModel>>.seeded([]);

  Stream<List<CartModel>> get cartStream => cartController.stream;

  Future<void> addCartItem(CartModel cartProduct) async {

    product.add(cartProduct);

    User? user = FirebaseAuth.instance.currentUser;

    if(user != null){  
      await firebase
        .collection("Users")
        .doc(user.uid)
        .collection("cart")
        .add(cartProduct.toMap()).then((doc) {
          cartProduct.cId = doc.id;
      });
    }

    cartController.sink.add(product); 
  }

  Future<void> loadCartItem() async {
    
    User? user = FirebaseAuth.instance.currentUser;

  if(user != null){    
      QuerySnapshot querySnapshot = await firebase
        .collection("Users")
        .doc(user.uid)
        .collection("cart")
        .get();

      product = querySnapshot.docs.map((doc) => CartModel.fromFirestore(doc)).toList();
    }

    cartController.sink.add(product);
  }

  @override
  void dispose() {
    super.dispose();

    cartController.close();
  }

}