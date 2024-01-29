import 'package:flutter/material.dart';
import 'package:shoes_store/model/user_model.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                Text("${userModel.address}")
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Card(
            elevation: 5,
            child: Row(
              children: [
                Text("${userModel.address}")
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Card(
            elevation: 5,
            child: Row(
              children: [
                Text("${userModel.address}")
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Card(
            elevation: 5,
            child: Row(
              children: [
                Text("${userModel.address}")
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Card(
            elevation: 5,
            child: Row(
              children: [
                Text("${userModel.address}")
              ],
            ),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }
}