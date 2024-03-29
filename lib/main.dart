import 'package:flutter/material.dart';
import 'package:tutorial_1/pages/home_page.dart';
import 'package:tutorial_1/pages/login_page.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:tutorial_1/utils/routes.dart';
import 'package:tutorial_1/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Myroutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        Myroutes.homeRoute: (context) => HomePage(),
        Myroutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
