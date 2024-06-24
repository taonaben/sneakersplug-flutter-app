import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/pages/intro_page.dart';

import 'models/cart.dart';

void main() {
  runApp(const ShoeShopApp());
}

class ShoeShopApp extends StatelessWidget {
  const ShoeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
