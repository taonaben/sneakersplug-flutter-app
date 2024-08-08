import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../pages/shoe_details_page.dart';
import '../models/shoe.dart';

class ShoeTileAddCart extends StatelessWidget {
  final Shoe shoe;
  final void Function()? onTap;

  const ShoeTileAddCart({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoeDetailPage(shoe: shoe)),
        );
      },
      child: IntrinsicHeight(
        child: Flexible(
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.asset(
                        shoe.imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,

                        // height: 150,
                      ),
                    ),

                    //wishlist btn
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          shoe.isLiked
                              ? Icons.favorite_rounded //liked
                              : Icons.favorite_border_rounded, //not liked
                          color: shoe.isLiked
                              ? Colors.red //liked
                              : Colors.grey[900], //not liked
                        ),
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false)
                              .toggleLike(shoe);
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    shoe.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${shoe.price}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //add to cart btn
                          GestureDetector(
                            onTap: onTap,
                            child: Container(
                              width: 80,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Icon(Icons.add_shopping_cart_rounded,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
