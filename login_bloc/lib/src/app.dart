import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
      title: 'log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    ),
    );
  }
}