import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomPhoneTextFieldWidget extends StatelessWidget {
  const CustomPhoneTextFieldWidget({
    required this.textEditingController,
    super.key,
    required this.maskFormatter,
  });
 final TextEditingController textEditingController;

  final MaskTextInputFormatter maskFormatter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
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
        hintText: '+7 (XXX) XXX XX XX',
        hintStyle: const TextStyle(
          color: Color.fromRGBO(194, 194, 194, 1),
          fontFamily: 'Bitter',
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        prefixStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Bitter'),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 6.0, horizontal: 10),
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [maskFormatter],
    );
  }
}
