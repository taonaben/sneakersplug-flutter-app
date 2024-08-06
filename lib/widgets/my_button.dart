import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {
  final String btnLabel;
  final Function()? onTap;

  const MYButton({super.key, required this.btnLabel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Text(
            btnLabel,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
