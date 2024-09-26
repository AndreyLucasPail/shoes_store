import 'package:flutter/material.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/ui/track_order/widgets/track_order_tab.dart';
import 'package:shoes_store/ui/track_order/widgets/address_tile.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class TrackOrderScreenArgs {
  TrackOrderScreenArgs({this.order});
  OrderModel? order;
}

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key, this.order});

  static const tag = "/trackOrder";

  final OrderModel? order;

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        iconTheme: const IconThemeData(color: CustomColors.white),
        title: const Text(
          "Rastreamento do pedido",
          style: TextStyle(color: CustomColors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AddressCard(
            order: widget.order,
          ),
          TrackOrderCard(
            order: widget.order,
          ),
        ],
      ),
    );
  }
}
