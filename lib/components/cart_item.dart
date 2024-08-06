import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/widgets/cart_counter.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({super.key, required this.shoe});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;
  late double updatedPrice;

  @override
  void initState() {
    super.initState();
    quantity = widget.shoe.quantity;
    updatedPrice = widget.shoe.price * quantity;
    widget.shoe.updatedPrice = updatedPrice;
  }

  void _updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      updatedPrice = widget.shoe.price * quantity;
    });
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
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: Image.asset(
              widget.shoe.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shoe.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${updatedPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
            child: CartItemCounter(
              shoe: widget.shoe,
              quantity: quantity,
              updateQuantity: _updateQuantity,
              removeItem: () => removeItemFromCart(context),
            ),
          ),
        ],
      ),
    );
  }
}
