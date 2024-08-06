import 'package:flutter/material.dart';
import 'package:sneakersplug/services/auth/auth_service.dart';
import 'package:sneakersplug/widgets/icon_tile.dart';
import 'package:sneakersplug/widgets/my_button.dart';
import 'package:sneakersplug/widgets/text_fields.dart';

class RegistrationPage extends StatefulWidget {
  final void Function()? onTap;
  const RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void register() async {
    //get auth service
    final authService = AuthService();

    //check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
          usernameController.text,
          passwordController.text,
        );
      } catch (e) {
        //show error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred while registering: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      }
    } else {
      //show error message if passwords don't match
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Passwords do not match'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'lib/images/logo1.png',
                    height: 240,
                    color: Colors.black,
                  ),
                ),

                // welcome back
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                //username textfields
                MyTextfield(
                  controller: usernameController,
                  obscureText: false,
                  hintText: 'Email',
                ),

                //password textfields
                MyTextfield(
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: true,
                ),

                //confirm password textfields
                MyTextfield(
                  controller: confirmPasswordController,
                  hintText: 'confirm password',
                  obscureText: true,
                ),

                //sign in btn
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
                  child: MYButton(btnLabel: 'Sign Up', onTap: register),
                ),

                // or continue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: .5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Text('or continue with'),
                    Expanded(
                      child: Divider(
                        thickness: .5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),

                //google + apple btn
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTile(imagePath: 'lib/images/google_icon.png'),
                      SizedBox(
                        width: 10,
                      ),
                      IconTile(imagePath: 'lib/images/apple_icon.png')
                    ],
                  ),
                ),

                // not a member> register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
