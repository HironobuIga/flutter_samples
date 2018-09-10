import 'package:flutter/material.dart';
import '../mixin/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return LoginScreenState();
    }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passWordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType:  TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText:  'you@example.com', 
      ),
      validator: validateEmail,
      onSaved:  (String value) {
        email = value;
      },
    );
  }

  Widget passWordField() {
      return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to API');
        }
      },
    );
  }
}