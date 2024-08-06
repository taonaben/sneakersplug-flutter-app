import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryText;
  final String categoryImageURl;
  final IconData? categoryIcon;
  final void Function()? onTap;

  const CategoryItem({
    super.key,
    required this.categoryText,
    required this.categoryIcon,
    required this.onTap,
    required this.categoryImageURl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              categoryIcon,
              color: Colors.black,
            ),
            Image.asset(categoryImageURl)
          ],
        ),
      ),
      title: Text(
        categoryText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
