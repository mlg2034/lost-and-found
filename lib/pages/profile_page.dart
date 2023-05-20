import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamyrlan/pages/login_page.dart';

import '../widgets/text_widgets/custom_text_change_widget.dart';
import '../widgets/text_widgets/custom_text_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 159,
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
                    _getFromGallery();
                  },
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(100, 93, 215, 1),
                    radius: 68,
                    backgroundImage: _imageFile != null
                        ? Image.file(_imageFile!, fit: BoxFit.cover).image
                        : AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 249),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Sharapova Amina',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Bitter',
                        color: Colors.black),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       height: 18,
                //       width: 18,
                //       child: Image.asset('assets/images/star.png'),
                //     ),
                //     const SizedBox(
                //       width: 3,
                //     ),
                //     SizedBox(
                //       height: 18,
                //       width: 18,
                //       child: Image.asset('assets/images/star.png'),
                //     ),
                //     const SizedBox(
                //       width: 3,
                //     ),
                //     SizedBox(
                //       height: 18,
                //       width: 18,
                //       child: Image.asset('assets/images/star.png'),
                //     ),
                //     const SizedBox(
                //       width: 3,
                //     ),
                //     SizedBox(
                //       height: 18,
                //       width: 18,
                //       child: Image.asset('assets/images/star.png'),
                //     ),
                //     const SizedBox(
                //       width: 3,
                //     ),
                //     SizedBox(
                //       height: 18,
                //       width: 18,
                //       child: Image.asset('assets/images/star.png'),
                //     ),
                //     const SizedBox(
                //       width: 7,
                //     ),
                //     const Text(
                //       '5.0',
                //       style: TextStyle(
                //           fontFamily: 'Bitter',
                //           fontSize: 14,
                //           fontWeight: FontWeight.w400,
                //           color: Color.fromRGBO(135, 131, 131, 1)),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 33,
                ),
                const Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Bitter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomTextWidget(title: 'example@gmail.com',),
                const SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    //to change a email
                  },
                  child: CustomChangeTextWidget(changeTitle: 'Click to change email',),
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomTextWidget(title: '+7 (777) 777 77 77'),
                const SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    //to change a phone
                  },
                  child:CustomChangeTextWidget(changeTitle: 'Click to change phone number',),
                ),
                const SizedBox(
                  height: 23,
                ),
                CustomTextWidget(title: 'Payments'),
                const SizedBox(
                  height: 13,
                ),
                CustomTextWidget(title: 'Wallet'),
                const SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    //to view bonuses
                  },
                  child: CustomChangeTextWidget(changeTitle: 'Click to view bonuses',),
                ),
                const SizedBox(
                  height: 13,
                ),
               CustomTextWidget(title: 'Payment Card'),
                const SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    //to view bonuses
                  },
                  child: CustomChangeTextWidget(changeTitle: 'Click to link payment card',),
                ),
                const SizedBox(
                  height: 23,
                ),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Bitter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                const Row(
                  children: [
                    SizedBox(
                        child: Icon(
                      Icons.help_outline,
                      size: 15,
                    )),
                    Text(
                      'Help',
                      style: TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 10,
                        height: 13,
                        child: SvgPicture.asset('assets/images/file.svg')),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      'Terms of Use',
                      style: TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 13,
                        height: 12,
                        child: SvgPicture.asset('assets/images/triangle.svg')),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      'Privacy policy',
                      style: TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child:const Text(
                            'Log Out',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

