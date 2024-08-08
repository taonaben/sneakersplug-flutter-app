import 'package:flutter/material.dart';
import 'package:sneakersplug/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Progress'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check_circle_outline_rounded),
                ),
                Text(
                  "Completed",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )
              ],
            ),
            MyReceipt(),
          ],
        ),
      ),
    );
  }
}
