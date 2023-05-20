import 'package:flutter/material.dart';

import '../widgets/text_field_widget/custom_text_field_for_password.dart';
import '../widgets/text_field_widget/cutom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
   RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
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
                      padding: const EdgeInsets.only(top: 252),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Registration',
                                style: TextStyle(
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Color.fromRGBO(67, 197, 158, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            CustomTextField(
                              textFieldName: 'First Name', textEditingController: textController,
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            CustomTextField(

                              textFieldName: 'Last  Name', textEditingController: textController,
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            CustomTextField(
                              textFieldName: 'Email or phone number', textEditingController: textController ,
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            CustomTextFieldForPassword(
                              passwordTextField: 'Password',
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            CustomTextFieldForPassword(
                              passwordTextField: 'ConfirmPassword',
                            )
                          ],
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
