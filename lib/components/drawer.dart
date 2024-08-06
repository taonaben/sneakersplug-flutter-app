import 'package:flutter/material.dart';
import 'package:sneakersplug/services/auth/auth_service.dart';
import 'package:sneakersplug/widgets/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Image.asset(
                  'lib/images/logo1.png',
                  color: Colors.white,
                ),
              ),

              // Other pages
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: MyDrawerTile(
                  text: "Home",
                  icon: Icons.home,
                  onTap: () {},
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: MyDrawerTile(
                  text: "About",
                  icon: Icons.info,
                  onTap: () {},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: MyDrawerTile(
              text: 'Logout',
              icon: Icons.logout,
              onTap: () {
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
