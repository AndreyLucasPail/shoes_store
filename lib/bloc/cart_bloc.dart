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
  int? counter = 0;

  final cartController = BehaviorSubject<List<CartModel>>.seeded([]);
  final quantityController = BehaviorSubject<int>();
  final priceController = BehaviorSubject<double>.seeded(0.0);

  Stream<List<CartModel>> get cartStream => cartController.stream;
  Stream<int> get quantityStream => quantityController.stream;
  Stream<double> get priceStream => priceController.stream;


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

  void removeCartProduct(CartModel cartProduct){

    User? user = FirebaseAuth.instance.currentUser;

    if(user != null){
      firebase.collection("Users")
      .doc(user.uid)
      .collection("cart")
      .doc(cartProduct.cId)
      .delete();

      product.remove(cartProduct);

      cartController.sink.add(product);
    }
  }

  void incProduct(CartModel cartProduct){
    User? user = FirebaseAuth.instance.currentUser;

    counter = cartProduct.quantity;
    cartProduct.quantity = counter! + 1;

    firebase.collection("Users")
      .doc(user!.uid)
      .collection("cart")
      .doc(cartProduct.cId)
      .update(cartProduct.toMap());

    quantityController.sink.add(cartProduct.quantity!);
  }

  void decProduct(CartModel cartProduct){
    User? user = FirebaseAuth.instance.currentUser;

    counter = cartProduct.quantity;
    cartProduct.quantity = counter! - 1;

    firebase.collection("Users")
      .doc(user!.uid)
      .collection("cart")
      .doc(cartProduct.cId)
      .update(cartProduct.toMap());

    quantityController.sink.add(cartProduct.quantity!);
    
  }

  double getPrice(){
    double price = 0.0;

    for(CartModel item in product){
      if(item.price != null){
        price += item.price!.toDouble() * item.quantity!.toDouble();
      }
    }

    priceController.sink.add(price);

    return price;
  }

  double shipPrice(){
    return 9.99;
  }

  Future<String?> finishOrder() async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentReference ref = await firebase.collection("Users").doc(user!.uid).collection("orders").add(
      {
        "products" : product.map((cartProduct) => cartProduct.toMap()).toList(),
        "productsPrice" : getPrice(),
        "shipPrice" : shipPrice(),
        "totalPrice" : getPrice() + shipPrice(),
        "status" : 1,
        "orderDate" : DateTime.now(),
      }
    );

    QuerySnapshot query = await firebase.collection("Users").doc(user.uid).collection("cart").get();

    for(DocumentSnapshot doc in query.docs){
      doc.reference.delete();
    }

    product.clear();

    return ref.id;
  }

  @override
  void dispose() {
    super.dispose();

    cartController.close();
  }

}