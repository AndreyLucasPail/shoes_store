import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';

mixin SingupMixin {
  final UserBloc userBloc = UserBloc();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cepController = TextEditingController();
  final birthdayController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
}
