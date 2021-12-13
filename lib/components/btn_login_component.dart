import 'package:flutter/material.dart';
import 'package:flutter_splash/controller/login_controller.dart';

class BtnLoginComponents extends StatelessWidget {
  final LoginController loginController;

  const BtnLoginComponents({Key? key, required this.loginController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.notifier,
      builder: (_, notifier, __) => notifier
          ? const CircularProgressIndicator()
          : SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  loginController.auth().then(
                        (value) => value == true ? Navigator.of(context).pushReplacementNamed('/home') : buildShowSnackBar(context),
                      );
                },
                child: const Text('Login'),
              ),
            ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Erro ao logar',
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
  }
}
