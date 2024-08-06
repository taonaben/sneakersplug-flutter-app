import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Contact us', style: TextStyle(),),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('About us'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Settings'),
        ),
      ],
    );

  }
}