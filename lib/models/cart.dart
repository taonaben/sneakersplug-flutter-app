import 'package:flutter/cupertino.dart';
import 'package:sneakersplug/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe('Futro Mixr', "30", "Sneakers", 'lib/images/Adidas Futro Mixr.jpg',
        [8, 9, 10, 11]),
    Shoe('Futro Mixr Retro', "40", "Sneakers",
        'lib/images/Adidas Futro Mixr1.jpg', [6, 7, 9]),
    Shoe('Kobe Mamba', "45", "Basketball", 'lib/images/Nike Kobe Mamba.jpg',
        [9, 10, 11]),
    Shoe('Kobe Mamba Fury', "30", "Basketball",
        'lib/images/Nike Kobe Mamba Fury.jpg', [8, 9, 10]),
    Shoe('Lebron 19Melon', "50", "Basketball",
        'lib/images/Nike Lebron 19Melon.jpg', [6, 7, 8, 9]),
    Shoe('Air Force 1', '30', 'Sneaker', 'lib/images/Air Force 1.jpg',
        [5, 6, 7, 8, 9]),
    Shoe('Air Jordan 11 Low Space Jam', '50', 'Sneaker',
        'lib/images/Air Jordan 11 Low Space Jam.jpg', [7, 8]),
    Shoe('Cactus Jack Jordan 1 Lowcut', '30', 'Sneaker',
        'lib/images/Cactus Jack Jordan 1 Lowcut.jpg', [7, 8, 9]),
    Shoe('Jordan 1 Limited Edition', '35', 'Sneaker',
        'lib/images/Jordan 1 Limited Edition.jpg', [7, 8, 9]),
    Shoe('Paul Gorge 45', '45', 'Basketball', 'lib/images/Paul Gorge 45.jpg',
        [5, 6, 7, 8, 9]),
    Shoe('Puma Rihana', '30', 'Sneaker', 'lib/images/Puma Rihana.jpg',
        [5, 6, 7, 8, 9]),
  ];

  // list if items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
