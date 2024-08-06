import 'package:flutter/material.dart';
import 'package:sneakersplug/services/auth/auth_service.dart';
import 'package:sneakersplug/widgets/icon_tile.dart';
import 'package:sneakersplug/widgets/my_button.dart';
import 'package:sneakersplug/widgets/text_fields.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void login() async {
    //get instance of auth service
    final authService = AuthService();

    //try sign in user
    try {
      await authService.signInWithEmailPassword(
        usernameController.text,
        passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
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
                    'Welcome back!',
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

                //forgotpassword
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),

                //sign in btn
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
                  child: MYButton(btnLabel: 'Sign in', onTap: login),
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
                      'Not a member? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
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
