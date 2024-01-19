import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

  const InputWidget({super.key, required this.hinText, required this.controller, required this.obscureText});

  final String hinText ;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinText,
            contentPadding: EdgeInsets.symmetric(horizontal: 20)
        ),
      ),
    );
  }
}
