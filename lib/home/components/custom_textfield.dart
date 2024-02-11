import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
   CustomTextfield({required this.controller, required this.title});

  TextEditingController controller;
  String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
