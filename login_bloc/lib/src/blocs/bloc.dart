import 'dart:async';
import 'package:login_bloc/src/blocs/validators.dart';

class Bloc extends Object with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();
  
  // streamへのデータ追加
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  
  // streamからのデータ取得
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  dispose() {
    _email.close();
    _password.close();
  }
}