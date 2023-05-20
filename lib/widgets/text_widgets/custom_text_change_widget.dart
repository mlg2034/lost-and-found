import 'package:flutter/material.dart';

class CustomChangeTextWidget extends StatelessWidget {
  final String changeTitle;
  const CustomChangeTextWidget({
    required this.changeTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      changeTitle,
      style:const TextStyle(
          decoration: TextDecoration.underline,
          decorationThickness: 1,
          decorationColor: Color.fromRGBO(135, 131, 131, 1),
          fontFamily: 'Bitter',
          fontWeight: FontWeight.w200,
          fontSize: 13,
          color: Color.fromRGBO(135, 131, 131, 1)),
    );
  }
}

