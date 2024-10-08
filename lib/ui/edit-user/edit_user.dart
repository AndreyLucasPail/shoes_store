// ignore_for_file: no_logic_in_create_state, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/user_model.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';
import 'package:shoes_store/widgets/user_text_field.dart';

class EditUserScreenArgs {}

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, this.userModel});

  final UserModel? userModel;

  static const tag = "/editUser";

  @override
  State<EditUserScreen> createState() => _EditUserScreenState(userModel);
}

class _EditUserScreenState extends State<EditUserScreen> {
  _EditUserScreenState(this.userModel);

  final UserModel? userModel;
  late UserBloc? userBloc = UserBloc();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final birthdayController = TextEditingController();
  final cepController = TextEditingController();
  final cityController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final stateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        iconTheme: const IconThemeData(
          color: CustomColors.white,
        ),
        title: const Text(
          "Editar perfil",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          UserTextField(
            labelText: "Nome:",
            hintText: "${userModel!.name}",
            controller: nameController,
          ),
          UserTextField(
            labelText: "Email:",
            hintText: "${userModel!.email}",
            inputType: TextInputType.emailAddress,
            controller: emailController,
          ),
          UserTextField(
            labelText: "Endereço:",
            hintText: "${userModel!.address}",
            inputType: TextInputType.streetAddress,
            controller: addressController,
          ),
          UserTextField(
            labelText: "Data de nascimento:",
            hintText: "${userModel!.birthday}",
            inputType: TextInputType.datetime,
            controller: birthdayController,
          ),
          UserTextField(
            labelText: "Cidade:",
            hintText: "${userModel!.city}",
            inputType: TextInputType.streetAddress,
            controller: cityController,
          ),
          UserTextField(
            labelText: "Bairro:",
            hintText: "${userModel!.neighborhood}",
            inputType: TextInputType.streetAddress,
            controller: neighborhoodController,
          ),
          UserTextField(
            labelText: "Estado:",
            hintText: "${userModel!.state}",
            inputType: TextInputType.streetAddress,
            controller: stateController,
          ),
          UserTextField(
            labelText: "CEP:",
            hintText: "${userModel!.cep}",
            inputType: TextInputType.number,
            controller: cepController,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.midNigthBlue,
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                Map<String, dynamic> userData = {
                  "name": nameController.text == ""
                      ? userModel!.name
                      : nameController.text,
                  "email": emailController.text == ""
                      ? userModel!.email
                      : emailController.text,
                  "adress": addressController.text == ""
                      ? userModel!.address
                      : addressController.text,
                  "birthday": birthdayController.text == ""
                      ? userModel!.birthday
                      : birthdayController.text,
                  "CEP": cepController.text == ""
                      ? userModel!.cep
                      : cepController.text,
                  "city": cityController.text == ""
                      ? userModel!.city
                      : cityController.text,
                  "neighborhood": neighborhoodController.text == ""
                      ? userModel!.neighborhood
                      : neighborhoodController.text,
                  "state": stateController.text == ""
                      ? userModel!.state
                      : stateController.text,
                };

                await userBloc!.updateUser(userData);

                onSuccess();

                Navigator.of(context).pop(userData);
              },
              child: const Text(
                "Salvar",
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 38, 24, 94),
        content: Text(
          "Usuaria atualizado com sucesso!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
