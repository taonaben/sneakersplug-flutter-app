import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../pages/shoe_details_page.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final void Function()? onTap;

  const ShoeTile({super.key, required this.shoe, required this.onTap});

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
                border: Border.all(color: Colors.white)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Shoe pic
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.asset(
                    shoe.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    // height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shoe name
                      Text(
                        shoe.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //price
                          Text('\$ ${shoe.price}',
                              style: const TextStyle(fontSize: 18)),
                          //wishlist btn
                          IconButton(
                            icon: Icon(
                              shoe.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color:
                                  shoe.isLiked ? Colors.red : Colors.grey[900],
                            ),
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false)
                                  .toggleLike(shoe);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
