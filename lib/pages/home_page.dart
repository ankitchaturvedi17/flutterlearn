import 'package:flutter/material.dart';
import 'package:tutorial_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Center(
        child: Container(
          child: Text("Welcome To $days days of flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
