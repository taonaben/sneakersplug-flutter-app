
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/components/shoe_tile.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class ShoeSection extends StatefulWidget {
  const ShoeSection({super.key});

  @override
  State<ShoeSection> createState() => _ShoeSectionState();
}

class _ShoeSectionState extends State<ShoeSection> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // Alert user with a Snackbar
    final snackBar = SnackBar(
      content: Text('${shoe.name} added to cart!'),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => SingleChildScrollView(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'For you',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),

                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // for you shoes
                  SizedBox(
                    height: 270, // Adjust the height as needed
                    child: ListView.builder(
                      itemCount: value.shoeShop.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Shoe shoe = value.getShoeList()[index];
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => addShoeToCart(shoe),
                        );
                      },
                    ),
                  ),
                ]
                )
        )
    );
  }
}
