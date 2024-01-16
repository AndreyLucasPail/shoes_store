import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/validators/validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shoes_store/model/user_model.dart';


class UserBloc extends BlocBase with Validator{

  final nameController = BehaviorSubject<String>();
  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final addressController = BehaviorSubject<String>();
  final birthdayController = BehaviorSubject<String>();
  final cepController = BehaviorSubject<String>();
  StreamController<UserModel> userController = StreamController<UserModel>();

  Stream<String> get outName => nameController.stream.transform(nameValidator);
  Stream<String> get outEmail => emailController.stream.transform(validateEmail);
  Stream<String> get outpass => passwordController.stream.transform(validatePassword);
  Stream<String> get outAddress => addressController.stream.transform(addressValidator);
  Stream<String> get outBirthday => birthdayController.stream.transform(birthdayValidator);
  Stream<String> get outCep => cepController.stream.transform(cepValidator);
  Stream<UserModel> get outUser => userController.stream;

  Map<String, dynamic> userData = {};
  FirebaseAuth auth = FirebaseAuth.instance;
  User? firebaseUser;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  UserModel? currentUserData;

  Future<void> saveUser(Map<String, dynamic> userData, User? firebaseUser) async {
    this.userData = userData;
    await firebase.collection("Users").doc(firebaseUser!.uid).set(userData);
  }

  void singUp({required Map<String, dynamic> userData,required String password, 
    required VoidCallback onSuccess, required VoidCallback onFail}){
    auth.createUserWithEmailAndPassword(
      email: userData["email"], 
      password: password,
    ).then((user) async {
      firebaseUser = user.user;
      await saveUser(userData, firebaseUser!);
      onSuccess();
    }).catchError((e){
      onFail();
    });
  }

  Stream<bool> submitedValidSingUp() => Rx.combineLatest6(
    outName, outEmail, outpass, outAddress, outBirthday, outCep, 
    (a, b, c, d, e, f) => true
  );

  Stream<bool> submitedValid() => Rx.combineLatest2(
    outEmail, outpass, (a, b) => true
  );

  Function(String)? get changeName => nameController.sink.add;
  Function(String)? get changeEmail => emailController.sink.add;
  Function(String)? get changePass => passwordController.sink.add;
  Function(String)? get changeAddres => addressController.sink.add;
  Function(String)? get changeBirthday => birthdayController.sink.add;
  Function(String)? get changeCep => cepController.sink.add;

  void login(String email, String password, VoidCallback onSuccess, VoidCallback onFail){
    auth.signInWithEmailAndPassword(
      email: email, password: password,
    ).then((user) async {

      firebaseUser = user.user;
      await loadCurrentUser();
      onSuccess();
      print('Usuário atual após login: $firebaseUser');

    }).catchError((e){
      print('Erro no login: $e');
      onFail();

    });
  }

  void singOut() async {
    await auth.signOut();

    userData = <String, dynamic>{};
    firebaseUser = null;
  }

  void recoverPass(String email) {
    auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  Future<UserModel?> loadCurrentUser() async {
    firebaseUser ??= auth.currentUser;

    if(firebaseUser != null){
      DocumentSnapshot docUser = await firebase.collection("Users").doc(firebaseUser!.uid).get();
      currentUserData = UserModel.fromFirestore(docUser);
      userController.add(currentUserData!);
      print('Usuário atual carregado: ${currentUserData!.name}');
    }

    return currentUserData;
  }
  
  @override
  void dispose() {
    super.dispose();
    nameController.close();
    emailController.close();
    passwordController.close();
    addressController.close();
    birthdayController.close();
    cepController.close();
    userController.close();
  }
}