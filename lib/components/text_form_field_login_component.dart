import 'package:flutter/material.dart';

class TextFormFieldLoginComponent extends StatelessWidget {
  final String labelText;
  final String hint;
  final bool password;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  const TextFormFieldLoginComponent(
      {Key? key,
      required this.labelText,
      required this.hint,
      required this.password,
      required this.onChanged,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        hintText: hint,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
