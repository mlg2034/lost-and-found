import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tamyrlan/pages/menu_page.dart';
import 'package:tamyrlan/widgets/text_field_widget/custom_phone_text_field.dart';

import '../widgets/text_field_widget/custom_text_field_for_password.dart';
import '../widgets/text_field_widget/cutom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final formGlobalKey = GlobalKey<FormState>();
final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           SingleChildScrollView(
             child: Column(
                children: [
                  Stack(
                    children: [
                      Transform.rotate(
                        angle: 0.443,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Transform.rotate(
                            angle: -0.443,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Image.asset(
                                'assets/images/Vectorcorner.png',
                                width: 273.w,
                                height: 273.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 166, left: 66),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child:
                                Image.asset('assets/images/VectorRectangle.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 373,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Lost & Found',
                              style: TextStyle(
                                  color: Color.fromRGBO(67, 197, 158, 1),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                             SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 52),
                              child: CustomPhoneTextFieldWidget(maskFormatter:maskFormatter, textEditingController: textController,)
                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 52),
                              child: Form(
                                key: formGlobalKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      maxLength: 4,
                                      textAlign: TextAlign.center,
                                      cursorColor:
                                          const Color.fromRGBO(67, 197, 158, 1),
                                      decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  67, 197, 158, 1)),
                                          borderRadius: BorderRadius.circular(11),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(11),
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  194, 194, 194, 1)),
                                        ),
                                        hintText: '__ __ __ __  ',
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
                                          fontFamily: 'Bitter',
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6.0, horizontal: 10),
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                     SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                      width: 246.w,
                                      child: OutlinedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                              ),
                                            ),
                                            side: MaterialStateProperty.all<
                                                BorderSide>(
                                              const BorderSide(
                                                  color: Color.fromRGBO(
                                                      67, 197, 158, 1)),
                                            ),
                                          ),
                                          onPressed: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      MenuPage())),
                                          child: const Text(
                                            'Continue',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    67, 197, 158, 1),
                                                fontSize: 16,
                                                fontFamily: 'Bitter',
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 610),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Transform.rotate(
                            angle: 3.138,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Expanded
                              (
                                child: Image.asset(
                                  'assets/images/Vectorcorner.png',
                                  width: 273.w,
                                  height: 273.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 666),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset('assets/images/green_circle.png')),
                      ),
                    ],
                  ),
                ],
              ),
           ),
          
        ],
      ),
    );
  }
}
