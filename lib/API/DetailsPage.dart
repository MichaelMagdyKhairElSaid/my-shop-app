import 'package:flutter/material.dart';
import 'package:iq_project/API/postProducts.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('${product.name} ${product.name}'), // you can nest here api and get object inside object
        ),
        body: Center(
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Image.network(product.image),
              const SizedBox(
                height: 30,
              ),
              Text('here is average')
            ])));
  }
}