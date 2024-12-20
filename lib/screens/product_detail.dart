import 'package:flutter/material.dart';
import 'package:my_dairy_mobile/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text("Price: Rp${product.fields.price}"),
            const SizedBox(height: 8),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 8),
            Text("Fat Content: ${product.fields.fatContent}"),
            const SizedBox(height: 8),
            Text("Quantity: ${product.fields.quantity}"),
            const SizedBox(height: 8),
            Text("Rating: ${product.fields.rating}"),
          ],
        ),
      ),
    );
  }
}
