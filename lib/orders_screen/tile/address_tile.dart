// ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/model/user_model.dart';

class TrackOrderCard extends StatefulWidget {
  const TrackOrderCard({super.key, this.order});

  final OrderModel? order;

  @override
  State<TrackOrderCard> createState() => _TrackOrderCardState(order);
}

class _TrackOrderCardState extends State<TrackOrderCard> {
  _TrackOrderCardState(this.order);

  final OrderModel? order;
  UserBloc userBloc = UserBloc();
  
  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();

    userBloc.loadCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: userBloc.outUser,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{

          UserModel? userModel = snapshot.data;

          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/pagina-inicial.png"))
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Id do pedido:\n ${order!.id}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),                
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Endereço de entrega:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Text(
                          userModel?.address ?? "Endereço não disponível",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          "CEP: ${userModel!.cep}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    );
  }
}