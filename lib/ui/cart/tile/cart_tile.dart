import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/model/cart_model.dart';
import 'package:blur/blur.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cartProduct, this.cartBloc,});

  final CartModel? cartProduct;
  final CartBloc? cartBloc;
  
  @override
  Widget build(BuildContext context) {

    NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");
    
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 38, 24, 94),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete, color: Colors.white,)
            ),
          )
        ),
        confirmDismiss: (direction) => showDialogCart(context),       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                    "${cartProduct!.imgCart}"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 3, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cartProduct!.model}",
                      style: const TextStyle(
                        fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "Tamanho: ${cartProduct!.size}",
                      style: const TextStyle(
                        fontSize: 15
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      formatNumber.format(cartProduct!.price),
                      style: const TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<int>(
              stream: cartBloc!.quantityStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    IconButton(
                      onPressed: cartProduct!.quantity! > 1 ? () {
                        cartBloc!.decProduct(cartProduct!);
                      } : null,
                      icon: const Icon(Icons.remove)
                    ),
                    Text("${cartProduct!.quantity}"),
                    IconButton(
                      onPressed: () {
                        cartBloc!.incProduct(cartProduct!);
                      }, 
                      icon: const Icon(Icons.add)
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showDialogCart(BuildContext context) async {
    return showDialog(
      context: context, 
      builder: (context){
        return Stack(
          children: [
            AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              title: const Text("Remover produto"),
              content: const Text("Certeza que deseja remover o  produto do carrinho?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),     
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    cartBloc!.removeCartProduct(cartProduct!);
        
                    Navigator.pop(context);
                  },     
                  child: const Text("Confirmar"),
                ),
              ],
            ).frosted(
              frostColor: const Color.fromARGB(255, 38, 24, 94),
            ),
          ],
        );
      }
    );
  }
}