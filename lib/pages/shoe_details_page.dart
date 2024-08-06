import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/components/shoe_tile_with_add_cart_btn.dart';
import 'package:sneakersplug/pages/home_page.dart';
import 'package:sneakersplug/widgets/counter.dart';
import '../components/shoe_size_row.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShoeDetailPage extends StatefulWidget {
  final Shoe shoe;

  const ShoeDetailPage({super.key, required this.shoe});

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  late int quantity;
  late double updatedPrice;

  @override
  void initState() {
    super.initState();
    quantity = widget.shoe.quantity;
    updatedPrice = widget.shoe.totalPrice;
  }

  void _updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      updatedPrice = widget.shoe.price * quantity;
      // widget.shoe.updatedPrice = widget.shoe.price * quantity;
    });
  }

  void addShoeToCart(Shoe shoe) {
    shoe.updateQuantity(quantity);
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    final snackBar = SnackBar(
      content: Text('${shoe.name} added to cart!'),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[200],
              elevation: 0,
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  child: Image.asset(widget.shoe.imagePath, fit: BoxFit.cover),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(initialIndex: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_bag_rounded),
                  ),
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.shoe.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        '\$${widget.shoe.price}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    'This would be the item description',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sizes',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 40,
                    child: ShoeSizeRow(shoe: widget.shoe),
                  ),
                  const SizedBox(height: 10),

                  // Counter
                  ItemCounter(
                    shoe: widget.shoe,
                    quantity: quantity,
                    updateQuantity: _updateQuantity,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You may like',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Consumer<Cart>(
                    builder: (context, value, child) {
                      return MasonryGridView.builder(
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
                          return ShoeTileAddCart(
                            shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(60, 80),
                      ),
                      child: Icon(
                        widget.shoe.isLiked
                            ? Icons.favorite_rounded // liked
                            : Icons.favorite_border_rounded, // not liked
                        color: widget.shoe.isLiked ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        cart.toggleLike(widget.shoe);
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  addShoeToCart(widget.shoe);
                  _updateQuantity(widget.shoe.quantity);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size(200, 80),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Add to bag',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '\$${updatedPrice.toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
