import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tamyrlan/pages/menu_page.dart';

import '../widgets/custom_text_field_for_password.dart';
import '../widgets/cutom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputValidationMixin {
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final formGlobalKey = GlobalKey<FormState>();
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
                              width: 273,
                              height: 273,
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
                          Text(
                            'Lost & Found',
                            style: TextStyle(
                                color: Color.fromRGBO(67, 197, 158, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 52),
                            child: TextFormField(
                              validator: (email) {
                                if (isEmailValid(email!))
                                  return null;
                                else
                                  return 'Enter a valid Email ';
                              },
                              cursorColor: Color.fromRGBO(67, 197, 158, 1),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(67, 197, 158, 1)),
                                    borderRadius: BorderRadius.circular(11)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(194, 194, 194, 1))),
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 52),
                            child: Form(
                              key: formGlobalKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    validator: (password) {
                                      if (isPasswordValid(password!))
                                        return null;
                                      else
                                        return 'Enter a valid password';
                                    },
                                    cursorColor:
                                        Color.fromRGBO(67, 197, 158, 1),
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
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 45,
                            width: 246,
                            child: OutlinedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    const BorderSide(
                                        color: Color.fromRGBO(67, 197, 158, 1)),
                                  ),
                                ),
                                onPressed: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();
                                  }
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: Color.fromRGBO(67, 197, 158, 1),
                                      fontSize: 16,
                                      fontFamily: 'Bitter',
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 590),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Transform.rotate(
                          angle: 3.138,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: Image.asset(
                              'assets/images/Vectorcorner.png',
                              width: 273,
                              height: 273,
                            ),
                          ),
                        ),
                      ),
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

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 4;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
