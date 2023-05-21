import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tamyrlan/widgets/text_field_widget/cutom_text_field.dart';

import '../widgets/text_field_widget/custom_phone_text_field.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  File? _imageFile;

  Future<void> _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: double.infinity,
      maxHeight: 139,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_errorText == null) {}
  }

  final textController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  String? get _errorText {
    final text = textController.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: 139,
                    width: 375,
                    child: GestureDetector(
                      onTap: () {
                        _getFromGallery();
                      },
                      child: _imageFile != null
                          ? FittedBox(
                              fit: BoxFit.cover,
                              child: Image.file(_imageFile!),
                            )
                          : FittedBox(
                              fit: BoxFit.cover,
                              child:
                                  Image.asset('assets/images/imagePicker.png'),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        //when Lost
                      },
                      child: Container(
                        width: 146,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(100, 93, 215, 1),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: Text(
                            'Lost',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 19.2 / 16),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        //when Found
                      },
                      child: Container(
                        width: 146,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(135, 131, 131, 0.5),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: Text(
                            'Found',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 19.2 / 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                const Text(
                  'Post title*',
                  style: TextStyle(
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
                CustomTextField(
                  textFieldName: 'Write a title of post',
                  textEditingController: textController,
                ),
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
                  onTap: () {},
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
                SizedBox(
                    height: 32,
                    child: CustomTextField(
                      textFieldName: 'Name Surname',
                      textEditingController: textController,
                    )),
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
                SizedBox(
                    height: 32,
                    child: CustomTextField(
                      textFieldName: 'example@gmail.com',
                      textEditingController: textController,
                    )),
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
                CustomPhoneTextFieldWidget(
                  maskFormatter: maskFormatter,
                  textEditingController: textController,
                ),
                const SizedBox(
                  height: 36,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () {},
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
