import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/validators/validator.dart';
import 'package:rxdart/rxdart.dart';


class SingUpBloc extends BlocBase with Validator{

  final nameController = BehaviorSubject<String>();
  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final addressController = BehaviorSubject<String>();
  final birthdayController = BehaviorSubject<String>();
  final cepController = BehaviorSubject<String>();

  Stream<String> get outName => nameController.stream.transform(nameValidator);
  Stream<String> get outEmail => emailController.stream.transform(validateEmail);
  Stream<String> get outpass => passwordController.stream.transform(validatePassword);
  Stream<String> get outAddress => addressController.stream.transform(addressValidator);
  Stream<String> get outBirthday => birthdayController.stream.transform(birthdayValidator);
  Stream<String> get outCep => cepController.stream.transform(cepValidator);

  String? firebaseUser;
  Map<String, dynamic> userData = {};
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveUser(Map<String, dynamic> userData, String firebaseUser) async {
    this.userData = userData;
    await FirebaseFirestore.instance.collection("Users").doc(firebaseUser).set(userData);
  }

  void singUp({required Map<String, dynamic> userData, required firebaseUser, required String password, 
    required VoidCallback onSuccess, required VoidCallback onFail}){
    auth.createUserWithEmailAndPassword(
      email: userData["email"], 
      password: password,
    ).then((user) async {
      await saveUser(userData, firebaseUser);
      onSuccess();
    }).catchError((e){
      onFail();
    });
  }

  Stream<bool> submitedValid() => Rx.combineLatest6(
    outName, outEmail, outpass, outAddress, outBirthday, outCep, 
    (a, b, c, d, e, f) => true
    );

  Function(String)? get changeName => nameController.sink.add;
  Function(String)? get changeEmail => emailController.sink.add;
  Function(String)? get changePass => passwordController.sink.add;
  Function(String)? get changeAddres => addressController.sink.add;
  Function(String)? get changeBirthday => birthdayController.sink.add;
  Function(String)? get changeCep => cepController.sink.add;
  
  @override
  void dispose() {
    super.dispose();
    nameController.close();
    emailController.close();
    passwordController.close();
    addressController.close();
    birthdayController.close();
    cepController.close();
  }
}