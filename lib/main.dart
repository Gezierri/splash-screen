import 'package:flutter/material.dart';
import 'package:flutter_splash/pages/details_page.dart';
import 'package:flutter_splash/pages/home_page.dart';
import 'package:flutter_splash/pages/login_page.dart';
import 'package:flutter_splash/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/login',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/details': (context) => const DetailsPage(),
        });
  }
}
