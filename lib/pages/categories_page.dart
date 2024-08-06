import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/section.dart';
import '../components/shoe_tile.dart';
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
              child: Column(
                children: [
                  // search bar
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.search, color: Colors.grey),
                      ],
                    ),
                  ),

                  // message
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      'Skibidi Toilet Rizz',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),

                  // hot picks
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Trending',
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

                  // trending shoes
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

                  const SizedBox(height: 20),

                  // For you
                  const ShoeSection(),
                ],
              ),
            ));
  }
}
