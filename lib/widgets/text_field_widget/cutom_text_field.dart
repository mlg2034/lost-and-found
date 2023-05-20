import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String textFieldName;
  final TextEditingController textEditingController;

  CustomTextField({
    required this.textEditingController,
    required this.textFieldName,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Widget build(BuildContext context) {
    var _text = '';
    return TextField(
      cursorColor: const Color.fromRGBO(67, 197, 158, 1),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromRGBO(67, 197, 158, 1)),
          borderRadius: BorderRadius.circular(11),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Color.fromRGBO(194, 194, 194, 1)),
        ),
        hintText: widget.textFieldName,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(194, 194, 194, 1),
          fontFamily: 'Bitter',
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
      ),
    );
  }
}
