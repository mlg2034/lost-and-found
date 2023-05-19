import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tamyrlan/widgets/cutom_text_field.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 139,
        maxHeight: double.infinity,
    );
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
    }
}

  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 91),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Create a post',
                    style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Color.fromRGBO(100, 93, 215, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                    height: 139,
                    width: 375,
                    child: GestureDetector(
                      onTap: () {
                        _getFromGallery();
                      },
                      child: Image.asset('assets/images/imagePicker.png'),
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Post title*',
                  style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
                CustomTextField(textFieldName: 'Write a title of post'),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Description*',
                  style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
                TextField(
                  cursorColor: Color.fromRGBO(67, 197, 158, 1),
                  maxLines: 6,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(67, 197, 158, 1)),
                        borderRadius: BorderRadius.circular(11)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(194, 194, 194, 1))),
                    hintText: 'Write a description of lost/found thing',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(194, 194, 194, 1),
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(194, 194, 194, 1),
                        borderRadius: BorderRadius.circular(5)),
                    width: double.infinity,
                    height: 42,
                    child: const Center(
                        child: Text(
                      's p e c i f y  l o c a t i on',
                      style: TextStyle(
                          fontFamily: 'Bitter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                const Center(
                  child: Text(
                    'Create a post',
                    style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Color.fromRGBO(100, 93, 215, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  'Contact Name*',
                  style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 3,
                ),
                const SizedBox(
                    height: 32,
                    child: CustomTextField(textFieldName: 'Name Surname')),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  'Email*',
                  style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 3,
                ),
                const SizedBox(
                    height: 32,
                    child: CustomTextField(textFieldName: 'example@gmail.com')),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  'Phone Number*',
                  style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
                TextField(
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
                ),
                const SizedBox(
                  height: 36,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    // to publish
                  },
                  child: Container(
                    width: 326,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(67, 197, 158, 1),
                        borderRadius: BorderRadius.circular(11)),
                    child: const Center(
                        child: Text(
                      'Publish',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Bitter',
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
