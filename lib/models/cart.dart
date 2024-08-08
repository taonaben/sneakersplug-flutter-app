import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sneakersplug/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe('Futro Mixr', 30, "Sneakers", 'lib/images/Adidas Futro Mixr.jpg',
        [8, 9, 10, 11], false),
    Shoe('Futro Mixr Retro', 40, "Sneakers",
        'lib/images/Adidas Futro Mixr1.jpg', [6, 7, 9], false),
    Shoe('Kobe Mamba', 45, "Basketball", 'lib/images/Nike Kobe Mamba.jpg',
        [9, 10, 11], false),
    Shoe('Kobe Mamba Fury', 30, "Basketball",
        'lib/images/Nike Kobe Mamba Fury.jpg', [8, 9, 10], false),
    Shoe('Lebron 19Melon', 50, "Basketball",
        'lib/images/Nike Lebron 19Melon.jpg', [6, 7, 8, 9], false),
    Shoe('Air Force 1', 30, 'Sneaker', 'lib/images/Air Force 1.jpg',
        [5, 6, 7, 8, 9], false),
    Shoe('Air Jordan 11 Low Space Jam', 45, 'Sneaker',
        'lib/images/Air Jordan 11 Low Space Jam.jpg', [7, 8], false),
    Shoe('Cactus Jack Jordan 1 Lowcut', 30, 'Sneaker',
        'lib/images/Cactus Jack Jordan 1 Lowcut.jpg', [7, 8, 9], false),
    Shoe('Jordan 1 Limited Edition', 70, 'Sneaker',
        'lib/images/Jordan 1 Limited Edition.jpg', [7, 8, 9], false),
    Shoe('Paul Gorge 45', 40, 'Basketball', 'lib/images/Paul Gorge 45.jpg',
        [5, 6, 7, 8, 9], false),
    Shoe('Puma Rihana', 55, 'Sneaker', 'lib/images/Puma Rihana.jpg',
        [5, 6, 7, 8, 9], false),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    //check if item is already in cart
    if (userCart.contains(shoe)) {
      int index = userCart.indexOf(shoe);
      userCart[index].quantity++;
    } else {
      shoe.quantity = 1;
      userCart.add(shoe);
    }
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (Shoe shoe in userCart) {
      total += shoe.updatedPrice;
    }
    return total;
  }

  double getNewPriceOfShoe(Shoe shoe) {
    shoe.updatedPrice += shoe.price * shoe.quantity;
    return shoe.updatedPrice;
  }

  // get total number of items
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (Shoe shoe in userCart) {
      totalItemCount += shoe.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  // toggle liked status
  void toggleLike(Shoe shoe) {
    shoe.isLiked = !shoe.isLiked;
    notifyListeners();
  }

  // get wishlist
  List<Shoe> getWishlist() {
    return shoeShop.where((shoe) => shoe.isLiked).toList();
  }

  /*

     H E L P E R S

  */

  // GENERATE A RECIEPT
  Widget getCartReceipt() {
    if (userCart.isEmpty) {
      return const Text("No items in cart.");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: userCart.map((cartItem) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      cartItem.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${cartItem.quantity} x ${cartItem.name}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                _formatPrice(cartItem.price),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  //FORMART DOUBLE VALUE INTO MONEY
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }
}
