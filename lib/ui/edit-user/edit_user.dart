// ignore_for_file: no_logic_in_create_state, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/mixins/edit_user_mixin.dart';
import 'package:shoes_store/model/user_model.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';
import 'package:shoes_store/widgets/user_text_field.dart';

class EditUserScreenArgs {}

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, this.userModel});

  final UserModel? userModel;

  static const tag = "/editUser";

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> with EditUserMixin {
  _EditUserScreenState();

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
            hintText: "${widget.userModel!.name}",
            controller: nameController,
          ),
          UserTextField(
            labelText: "Email:",
            hintText: "${widget.userModel!.email}",
            inputType: TextInputType.emailAddress,
            controller: emailController,
          ),
          UserTextField(
            labelText: "Endereço:",
            hintText: "${widget.userModel!.address}",
            inputType: TextInputType.streetAddress,
            controller: addressController,
          ),
          UserTextField(
            labelText: "Data de nascimento:",
            hintText: "${widget.userModel!.birthday}",
            inputType: TextInputType.datetime,
            controller: birthdayController,
          ),
          UserTextField(
            labelText: "Cidade:",
            hintText: "${widget.userModel!.city}",
            inputType: TextInputType.streetAddress,
            controller: cityController,
          ),
          UserTextField(
            labelText: "Bairro:",
            hintText: "${widget.userModel!.neighborhood}",
            inputType: TextInputType.streetAddress,
            controller: neighborhoodController,
          ),
          UserTextField(
            labelText: "Estado:",
            hintText: "${widget.userModel!.state}",
            inputType: TextInputType.streetAddress,
            controller: stateController,
          ),
          UserTextField(
            labelText: "CEP:",
            hintText: "${widget.userModel!.cep}",
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
                      ? widget.userModel!.name
                      : nameController.text,
                  "email": emailController.text == ""
                      ? widget.userModel!.email
                      : emailController.text,
                  "adress": addressController.text == ""
                      ? widget.userModel!.address
                      : addressController.text,
                  "birthday": birthdayController.text == ""
                      ? widget.userModel!.birthday
                      : birthdayController.text,
                  "CEP": cepController.text == ""
                      ? widget.userModel!.cep
                      : cepController.text,
                  "city": cityController.text == ""
                      ? widget.userModel!.city
                      : cityController.text,
                  "neighborhood": neighborhoodController.text == ""
                      ? widget.userModel!.neighborhood
                      : neighborhoodController.text,
                  "state": stateController.text == ""
                      ? widget.userModel!.state
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
        backgroundColor: CustomColors.midNigthBlue,
        content: Text(
          "Usuaria atualizado com sucesso!",
          style: TextStyle(
            color: CustomColors.midNigthBlue,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
