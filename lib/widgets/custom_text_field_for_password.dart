import 'package:flutter/material.dart';

class CustomTextFieldForPassword extends StatelessWidget {
  final String passwordTextField;
  const CustomTextFieldForPassword({
    required this.passwordTextField, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 52),
      child: TextField(
        obscureText: true,
        cursorColor: Color.fromRGBO(67, 197, 158, 1),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color:
                      Color.fromRGBO(67, 197, 158, 1)),
              borderRadius: BorderRadius.circular(11)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      194, 194, 194, 1))),
          hintText: passwordTextField,
          hintStyle: const TextStyle(
              color: Color.fromRGBO(194, 194, 194, 1),
              fontFamily: 'Bitter',
              fontWeight: FontWeight.w300,
              fontSize: 16),
        ),
      ),
    );
  }
}
