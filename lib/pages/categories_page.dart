import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/widgets/category_item.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        //Brands
        Text("Brands"),
        CategoryItem(
          categoryText: "NIKE",
          categoryIcon: null,
          onTap: null,
          categoryImageURl: "lib/images/nike_icon.png",
        ),

        //Sneaker type
        Text("Sneaker Type"),

        //colorways
        Text("Colorways"),

        //Collaborations
        Text("Collaborations")
      ],
    );
  }
}
