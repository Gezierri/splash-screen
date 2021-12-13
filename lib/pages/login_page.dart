import 'package:flutter/material.dart';
import 'package:flutter_splash/components/btn_login_component.dart';
import 'package:flutter_splash/components/text_form_field_login_component.dart';
import 'package:flutter_splash/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Login'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormFieldLoginComponent(
              labelText: 'E-mail',
              hint: 'Digite seu e-mail',
              password: false,
              controller: _controllerEmail,
              validator: _validateEmail,
              onChanged: _loginController.setLogin,
            ),
            _buildSizedBox(),
            TextFormFieldLoginComponent(
              labelText: 'Senha',
              hint: 'Digite sua senha',
              password: true,
              controller: _controllerPassword,
              validator: _validatePassword,
              onChanged: _loginController.setPassword,
            ),
            _buildSizedBox(),
            BtnLoginComponents(
              loginController: _loginController,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildSizedBox() {
    return const SizedBox(
      height: 8,
    );
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Campo email não pode estar vazio';
    }
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Campo senha não pode estar vazio';
    }
    if (value.length <= 2) {
      return 'Campo deve ser maior que 2 caracteres';
    }
  }
}
