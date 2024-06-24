import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe; // Changed to final
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void confirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: AlertDialog(
          backgroundColor: Colors.grey[100],
          title: Text('Remove ${widget.shoe.name} from cart?',
              style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                removeItemFromCart(context);
              },
              child: Text('Remove', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  void removeItemFromCart(BuildContext context) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.shoe.name} removed from cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text('\$ ${widget.shoe.price}'),
        // Adjusted string interpolation
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            confirm(context); // Fixed onPressed
          },
        ),
      ),
    );
  }
}
