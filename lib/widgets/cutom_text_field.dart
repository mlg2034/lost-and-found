import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textFieldName ; 
  const CustomTextField({
    required this.textFieldName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color.fromRGBO(67, 197, 158, 1),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(67, 197, 158, 1)),
          borderRadius: BorderRadius.circular(11)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(
              color: Color.fromRGBO(194, 194, 194, 1))),
        hintText: textFieldName,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(194, 194, 194, 1),
          fontFamily: 'Bitter',
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6.0, 
          horizontal: 10
        ),
      ),
    );
  }
}
