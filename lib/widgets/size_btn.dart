import 'package:flutter/material.dart';

class SizeBtn extends StatefulWidget {
  final int size;

  const SizeBtn({super.key, required this.size});

  @override
  State<SizeBtn> createState() => _SizeBtnState();
}

class _SizeBtnState extends State<SizeBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Text(widget.size.toString(), style: const TextStyle(fontSize: 15)),
      ),
    );
  }
}
