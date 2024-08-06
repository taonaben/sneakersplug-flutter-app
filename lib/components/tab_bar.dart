import 'package:flutter/material.dart';

class ShopTabBar extends StatelessWidget {
  final String tab1;
  final String tab2;
  final String tab3;

  const ShopTabBar({
    super.key,
    required this.tab1,
    required this.tab2,
    required this.tab3,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(text: tab1),
        Tab(text: tab2),
        Tab(text: tab3),
      ],
    );
  }
}
