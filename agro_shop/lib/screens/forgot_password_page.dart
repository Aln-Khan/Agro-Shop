import 'package:agro_shop/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/screens/signin_page.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPassword> {

  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/reset-password.png'),
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              MyTextField(
                controller: emailController,
                iconData: Icons.alternate_email,
                hintText: 'Enter your email address',
                obscureText: false
              ),

            const SizedBox(
              height: 30,
            ),

              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                  color: Constants.primaryColor, 
                  borderRadius: BorderRadius.circular(8),
                  ),
                child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'You remember the password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}