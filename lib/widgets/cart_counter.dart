import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartItemCounter extends StatefulWidget {
  final Shoe shoe;
  final int quantity;
  final Function(int) updateQuantity;
  final Function removeItem;

  const CartItemCounter({
    super.key,
    required this.shoe,
    required this.quantity,
    required this.updateQuantity,
    required this.removeItem,
  });
 
  @override
  _CartItemCounterState createState() => _CartItemCounterState();
}

class _CartItemCounterState extends State<CartItemCounter> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
    widget.shoe.quantity = quantity;
    widget.updateQuantity(quantity);
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        widget.removeItem();
      }
    });
    widget.shoe.quantity = quantity;
    widget.updateQuantity(quantity);
  }

  void confirm(BuildContext context, Shoe shoe) {
    showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: AlertDialog(
          backgroundColor: Colors.grey[100],
          title: Text('Remove ${shoe.name} from cart?',
              style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                removeItemFromCart(context, widget.shoe);
              },
              child: const Text('Remove', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  void removeItemFromCart(BuildContext context, Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${shoe.name} removed from cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: GestureDetector(
              onTap: (quantity > 1)
                  ? _decrementQuantity
                  : () => confirm(context, widget.shoe),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  quantity > 1 ? Icons.remove_rounded : Icons.delete_rounded,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white),
            ),
            child: Text(
              '$quantity',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: GestureDetector(
              onTap: _incrementQuantity,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.add_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
