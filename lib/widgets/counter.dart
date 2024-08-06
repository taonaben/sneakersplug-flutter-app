import 'package:flutter/material.dart';
import 'package:sneakersplug/models/shoe.dart';

class ItemCounter extends StatefulWidget {
  final Shoe shoe;
  final int quantity;
  final Function(int) updateQuantity;

  const ItemCounter({
    super.key,
    required this.shoe,
    required this.quantity,
    required this.updateQuantity,
  });

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
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
      }
    });
    widget.shoe.quantity = quantity;
    widget.updateQuantity(quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Qty: ',
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: GestureDetector(
            onTap: _decrementQuantity,
            child: Container( 
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: quantity == 1
                    ? Colors.transparent
                    : Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.remove_rounded,
                color: quantity == 1 
                ? Colors.grey
                : Colors. black),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.add_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
