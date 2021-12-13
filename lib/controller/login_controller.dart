import 'package:flutter/cupertino.dart';
import 'package:flutter_splash/service/prefes_service.dart';

class LoginController {
  final ValueNotifier<bool> notifier = ValueNotifier<bool>(false);

  String? _email;
  setLogin(String value) => _email = value;

  String? _password;
  setPassword(String value) => _password = value;

  Future<bool> auth() async {
    notifier.value = true;
    await Future.delayed(const Duration(seconds: 2));
    notifier.value = false;
    if(_email == 'admin' && _password == '123'){
      PrefsService.save(_email!);
      return true;
    }
    return false;
  }
}
