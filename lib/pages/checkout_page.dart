import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sneakersplug/pages/delivery_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = "";
  String cvvCode = '';
  bool isCvvFocused = false;

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV Code: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // cancel button
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            // yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryProgressPage(),
                    ));
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Center(child: Text("Checkout Page")),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // credit card
            CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {}),
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey),

            const SizedBox(height: 20), // Add some space before the button

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                onPressed: userTappedPay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: const Size(200, 60),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
