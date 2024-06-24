import 'package:flutter/material.dart';
import '../widgets/size_btn.dart';
import '../models/shoe.dart'; // Ensure this import is correct

class ShoeSizeRow extends StatelessWidget {
  final Shoe shoe;

  ShoeSizeRow({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: shoe.size.map((size) => SizeBtn(size: size)).toList(),
    );
  }
}
