import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';

mixin EditUserMixin {
  late UserBloc? userBloc = UserBloc();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final birthdayController = TextEditingController();
  final cepController = TextEditingController();
  final cityController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final stateController = TextEditingController();
}
