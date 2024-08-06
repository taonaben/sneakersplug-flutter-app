import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/firebase_options.dart';
import 'package:sneakersplug/pages/checkout_page.dart';
import 'package:sneakersplug/pages/home_page.dart';
import 'package:sneakersplug/pages/shop_page.dart';
import 'package:sneakersplug/services/auth/auth_gate.dart';
import 'models/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ShoeShopApp());
}

class ShoeShopApp extends StatelessWidget {
  const ShoeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
          // primarySwatch: Colors.grey,
          fontFamily: 'Nexa', // Set your font family here
        ),
        routes: {
          '/shoppage': (context) => const ShopPage(),
          '/homepage': (context) => const HomePage(),
          '/checkout': (context) => const CheckoutPage(),
        },
      ),
    );
  }
}
