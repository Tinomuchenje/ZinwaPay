import 'package:flutter/material.dart';
import 'views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zinwa Pay',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage());
  }
}