import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamyrlan/widgets/text_field_widget/cutom_text_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    File? _imageFile;
    final textController = TextEditingController();
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

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity.w,
                height: 159.h,
                color: Color.fromRGBO(100, 93, 215, 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 78),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color.fromRGBO(100, 93, 215, 1), width: 4),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // _getFromGallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(100, 93, 215, 1),
                        radius: 68,
                        backgroundImage: _imageFile != null
                            ? Image.file(_imageFile!, fit: BoxFit.cover).image
                            : const AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Center(
            child: Text(
              'Change Photo',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  height: 24 / 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Bitter'),
            ),
          ),
           SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Full name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
                CustomTextField(
                    textEditingController: textController,
                    textFieldName: 'New Name'),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
                CustomTextField(
                    textEditingController: textController,
                    textFieldName: 'New Email'),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: GestureDetector(
                    onTap: () {
                      final snackbar = SnackBar(
                        content: Center(
                          child: Text('Saved!' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                        ),
                        // action: SnackBarAction(label: 'Undo' , onPressed: (){},),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(231, 182, 56, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 20 / 18),
                      )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
