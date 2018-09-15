import 'dart:async';

class Bloc {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();
  
  // streamへのデータ追加
  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;
  
  // streamからのデータ取得
  Stream<String> get email => emailController.stream;
  Stream<String> get password => passwordController.stream;
}

