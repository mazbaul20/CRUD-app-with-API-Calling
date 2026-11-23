import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controllerName,
    required this.hintText,
  });

  final TextEditingController controllerName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerName,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}