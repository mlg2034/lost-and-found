import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  const CustomTextWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:const TextStyle(
          fontFamily: 'Bitter',
          fontSize: 16,
          fontWeight: FontWeight.w400),
    );
  }
}
