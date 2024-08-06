import 'package:flutter/material.dart';
import 'package:sneakersplug/components/bottom_nav_bar.dart';
import 'package:sneakersplug/components/drawer.dart';
import 'package:sneakersplug/pages/checkout_page.dart';
import 'package:sneakersplug/pages/profile_page.dart';
import 'package:sneakersplug/pages/shop_page.dart';
import 'package:sneakersplug/pages/wishlist.dart';
import 'package:sneakersplug/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // List of titles for each page
  final List<String> _pageTitles = [
    'Shop',
    'Wishlist',
    'My Bag',
    'Profile',
    'Checkout',
  ];

  // Update selected index
  void navigateBottomBar(int index) {
    setState(
      () {
        _selectedIndex = index;
        // _selectedIndex = widget.initialIndex;
      },
    );
  }

  // Pages to display
  final List<Widget> _pages = [
    const ShopPage(),
    const WishlistPage(),
    const CartPage(),
    const ProfilePage(),
    const CheckoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            _pageTitles[_selectedIndex], // Dynamic title
            style: const TextStyle(color: Colors.black),
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(Icons.menu, color: Colors.black),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_rounded, color: Colors.black),
            onPressed: () {
              navigateBottomBar(3); // Navigate to the Profile page
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}
