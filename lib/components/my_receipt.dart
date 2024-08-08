import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/models/cart.dart';
import 'package:sneakersplug/widgets/dotted_line.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Your Reciept",
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                            onPressed: printReciept(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                              foregroundColor: Colors.white,
                              shadowColor: Colors.grey[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.print_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Print"),
                              ],
                            ),
                          )
                        ],
                      ),
                      const MyDottedLine(),

                      //bought items here
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: cart.getCartReceipt(),
                      ),

                      const MyDottedLine(),
                      //recipt details
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            _buildInfoRow('Total',
                                "\$${cart.getTotalPrice().toString()}"),
                            _buildInfoRow('Total items',
                                cart.getTotalItemCount().toString()),
                            _buildInfoRow(
                                'Order Number', 'SO121900000565956190'),
                            _buildInfoRow('Completed Time', cart.getDateTime()),
                            _buildInfoRow('Accept Channel', 'SuperApp CX App'),
                            _buildInfoRow('Mobile Number', '781 830 006'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(),
            ),
          ),
        ],
      ),
    );
  }

  printReciept() {}
}
