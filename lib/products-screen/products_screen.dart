import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.category, this.brand});

  final String? category;
  final String? brand;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}