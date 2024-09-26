import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rideshare_/pages/Authentication/login_page.dart';
import 'package:rideshare_/pages/Authentication/sign_up_page.dart';
import 'package:rideshare_/text_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 63),
                SvgPicture.asset('Assets/Welcome Screen.svg'),
                const SizedBox(height: 29),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Color(0xFF414141),
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 12),
                const SizedBox(
                  width: 280,
                  child: Text(
                    "Have a better sharing experience",
                    style: TextStyle(
                      color: Color(0xFFA0A0A0),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 340,
                  height: 54,
                  child: Button(
                    text: 'Create an account',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 340,
                  height: 54,
                  child: BorderButton(
                    text: 'Log In',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            )
          ],
        ),
      ),
    );
  }
}
