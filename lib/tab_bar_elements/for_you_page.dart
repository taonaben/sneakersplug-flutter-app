import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
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
        child: Column(
          children: [
            // for you
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
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

            //for you shoes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 5,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                mainAxisSpacing: 5,
                itemCount: value.shoeShop.length,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoeList()[index];
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe),
                  );
                },
              ),
            ),

            // Expanded(
            //   child: MasonryGridView.builder(
            //     gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2),
            //     scrollDirection: Axis.vertical,
            //     crossAxisSpacing: 5,
            //     mainAxisSpacing: 5,
            //     itemCount: value.shoeShop.length,
            //     itemBuilder: (context, index) {
            //       Shoe shoe = value.getShoeList()[index];
            //       return ShoeTile(
            //         shoe: shoe,
            //         onTap: () => addShoeToCart(shoe),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
