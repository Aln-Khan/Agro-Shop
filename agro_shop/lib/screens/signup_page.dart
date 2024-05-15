// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agro_shop/components/my_button.dart';
import 'package:agro_shop/components/my_textfield.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/screens/profile_page.dart';
import 'package:agro_shop/screens/signin_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(); // Исправлено на _nameController
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String fullName = _nameController.text.trim(); // Получаем введенное имя

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('Registration successful: ${userCredential.user!.uid}');

      _emailController.clear();
      _passwordController.clear();
      _nameController.clear(); 

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignIn()), 
      );
    } catch (e) {
      print('Registration failed. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/signup.png', height: 200),
                const SizedBox(height: 30),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: _emailController,
                  iconData: Icons.mail,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _nameController,
                  iconData: Icons.person,
                  hintText: 'Full Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _passwordController,
                  iconData: Icons.lock,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: 'Sign Up',
                  onTap: _register,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignIn ()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
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

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
