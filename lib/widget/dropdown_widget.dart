import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          DropdownButton(
              value: null,
              onChanged: null,
              items: null,
          )
        ],
      ),
    );
  }
}
