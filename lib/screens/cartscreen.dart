import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<String> cart;
  final Function(String) removeFromCart;

  CartScreen({required this.cart, required this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () => removeFromCart(cart[index]),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle checkout logic here
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Proceeding to checkout...')),
            );
          },
          child: const Text('Checkout'),
        ),
      ],
    );
  }
}
