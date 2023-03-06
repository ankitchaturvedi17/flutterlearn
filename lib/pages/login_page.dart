import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
