// ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:shoes_store/model/order_model.dart';

class TrackOrderTab extends StatefulWidget {
  const TrackOrderTab({super.key, required this.order});

  final OrderModel? order;

  @override
  State<TrackOrderTab> createState() => _TrackOrderTabState(order);
}

class _TrackOrderTabState extends State<TrackOrderTab> {
  _TrackOrderTabState(this.order);

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildCircle(
                order!.status,
                1,
                "Pedido recebido",
                "assets/bloco-de-anotacoes.png",
              ),
              line(order!.status, 1),
              buildCircle(
                order!.status, 
                2, 
                "Pagamento confirmado",
                "assets/cartao.png",
              ),
              line(order!.status, 2),
              buildCircle(
                order!.status, 
                3, 
                "Em separação",
                "assets/cumprimento-de-pedidos.png",
              ),
              line(order!.status, 3),
              buildCircle(
                order!.status, 
                4, 
                "Pedido enviado",
                "assets/carro-van.png"
              ),
              line(order!.status, 4),
              buildCircle(
                order!.status, 
                5, 
                "Pedido saiu para entrega",
                "assets/van-de-entrega.png"
              ),
              line(order!.status, 5),
              buildCircle(
                order!.status, 
                6, 
                "Pedido entregue",
                "assets/entrega.png",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircle(int? status, int thisStatus, String? text, String? img){
    Color? color;

    if(status! < thisStatus){
      color = Colors.grey;
    }else if(status == thisStatus){
      color = const Color.fromARGB(255, 38, 24, 94);
    }else{
      color = Colors.green;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(37, 8, 20, 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: color,
              ),
              const SizedBox(width: 30,),
              SizedBox(
                height: 65,
                width: 65,
                child: Image.asset(img!)
              ),
              const SizedBox(width: 15,),
              Flexible(
                child: Text(
                  text!,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              ),        
            ],
          ),
        ),        
      ],
    );
  }

  Widget line(int? status, int thisStatus){
    Color? color;

    if(status! < thisStatus){
      color = Colors.grey;
    }else if(status == thisStatus){
      color = const Color.fromARGB(255, 38, 24, 94);
    }else{
      color = Colors.green;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          width: 10,
          color: color,
        ),
        const SizedBox(width: 80,),
        const SizedBox(width: 80,),
      ],
    );
  }
}