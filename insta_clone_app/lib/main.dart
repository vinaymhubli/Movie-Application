import 'package:flutter/material.dart';
import 'package:insta_clone_app/screens/splash_screen.dart';


void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Netflix_clone_app",
      theme: ThemeData(brightness: Brightness.dark, accentColor: Colors.black),
      home:NetflixSplash(),
    );
  }
}
