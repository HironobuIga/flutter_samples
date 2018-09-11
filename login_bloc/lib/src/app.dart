import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class App extends StatelessWidget {
  build(context) {
    return MaterialApp(
      title: 'log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}