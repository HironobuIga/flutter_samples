import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';
import 'package:login_bloc/src/blocs/provider.dart';

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