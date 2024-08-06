import 'package:flutter/material.dart';
import 'package:sneakersplug/services/auth/login_or_registration.dart';
import 'package:sneakersplug/widgets/my_button.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  void redirectTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/logo1.png',
                  height: 240,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              // Title
              const Text(
                "Welcome to SneakerPlug",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),
              // Subtitle
              const Text(
                'Brand new sneakers of the highest quality!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Sign In and Sign Up buttons
              MYButton(
                btnLabel: 'Continue',
                onTap: () => redirectTo(context, const loginOrRegister()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
