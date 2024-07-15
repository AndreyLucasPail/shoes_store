import 'package:flutter/material.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class TrackOrderCard extends StatefulWidget {
  const TrackOrderCard({super.key, required this.order});

  final OrderModel? order;

  @override
  State<TrackOrderCard> createState() => _TrackOrderCardState();
}

class _TrackOrderCardState extends State<TrackOrderCard> {
  _TrackOrderCardState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildCircle(
                widget.order!.status,
                1,
                "Pedido recebido",
                "assets/bloco-de-anotacoes.png",
              ),
              line(widget.order!.status, 1),
              buildCircle(
                widget.order!.status,
                2,
                "Pagamento confirmado",
                "assets/cartao.png",
              ),
              line(widget.order!.status, 2),
              buildCircle(
                widget.order!.status,
                3,
                "Em separação",
                "assets/cumprimento-de-pedidos.png",
              ),
              line(widget.order!.status, 3),
              buildCircle(
                widget.order!.status,
                4,
                "Pedido enviado",
                "assets/carro-van.png",
              ),
              line(widget.order!.status, 4),
              buildCircle(
                widget.order!.status,
                5,
                "Pedido saiu para entrega",
                "assets/van-de-entrega.png",
              ),
              line(widget.order!.status, 5),
              buildCircle(
                widget.order!.status,
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

  Widget buildCircle(int? status, int thisStatus, String? text, String? img) {
    Color? color;

    if (status! < thisStatus) {
      color = CustomColors.grey;
    } else if (status == thisStatus) {
      color = CustomColors.midNigthBlue;
    } else {
      color = CustomColors.green;
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
              const SizedBox(width: 30),
              SizedBox(
                height: 65,
                width: 65,
                child: Image.asset(img!),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  text!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget line(int? status, int thisStatus) {
    List<Color> color;

    if (status! < thisStatus) {
      color = [CustomColors.grey, CustomColors.grey];
    } else if (status == thisStatus) {
      color = [CustomColors.midNigthBlue, CustomColors.grey100];
    } else {
      color = [CustomColors.green, CustomColors.green];
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          width: 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: color,
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.5),
      ],
    );
  }
}
