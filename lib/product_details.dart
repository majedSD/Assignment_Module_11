
import 'package:assignmentmodule11/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child:Image.network(product.ThumbnailUrl),
            ),
            SizedBox(height: 20),
            Text("Title:${product.Title}"),
            Text('ID:${product.Id}')
          ],
        ),
      ),
    );
  }
}
