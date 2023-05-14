
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
    final String textHint;

  const CustomSearchTextField({
    super.key,
    required this.textHint
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:   40,
      child: TextField(
        cursorColor:const Color.fromRGBO(67, 197, 158, 1),
        decoration: InputDecoration(
          contentPadding:
             const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromRGBO(67, 197, 158, 1)),
              borderRadius: BorderRadius.circular(7)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(194, 194, 194, 1))),
          hintText: textHint,
          suffixIcon: const Icon(
            Icons.search,
            color: Color.fromRGBO(194, 194, 194, 1),
            size: 30,
          ),
          hintStyle: const TextStyle(
            color: Color.fromRGBO(194, 194, 194, 1),
            fontFamily: 'Bitter',
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
