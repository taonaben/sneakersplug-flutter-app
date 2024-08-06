import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/models/cart.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
          child:
              (Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Your Receipt',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 25),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            padding: const EdgeInsets.all(25),
            child: Consumer<Cart>(
              builder: (context, cart, child) =>
                  Text(cart.displayCartReceipt()),
            )),
      ]))),
    );
  }
}
