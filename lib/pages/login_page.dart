import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tamyrlan/bloc/login/login_bloc.dart';
import 'package:tamyrlan/domain/repository/auth_repository.dart';
import 'package:tamyrlan/pages/menu_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<AuthRepository>()),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginView> {
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final formGlobalKey = GlobalKey<FormState>();
  bool isCodeRequested = false;
  late LoginBloc _bloc;
  late TextEditingController phoneController;
  late TextEditingController codeController;

  @override
  void initState() {
    _bloc = context.read<LoginBloc>();
    phoneController = TextEditingController();
    codeController = TextEditingController();
    super.initState();
  }

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
                              controller: phoneController,
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
                                  Visibility(
                                    visible: isCodeRequested,
                                    child: TextFormField(
                                      controller: codeController,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  194, 194, 194, 1)),
                                        ),
                                        hintText: '__ __ __ __  ',
                                        hintStyle: const TextStyle(
                                          color:
                                              Color.fromRGBO(194, 194, 194, 1),
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
                                      onPressed: () {
                                        if (!isCodeRequested) {
                                          _bloc.add(LoginCodeRequested(
                                            phoneController.text,
                                          ));
                                        } else {
                                          _bloc.add(
                                            CodeSent(
                                              phoneController.text,
                                              int.parse(codeController.text),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(67, 197, 158, 1),
                                          fontSize: 16,
                                          fontFamily: 'Bitter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
          BlocListener<LoginBloc, LoginState>(
            listener: _stateListener,
            child: Container(),
          )
        ],
      ),
    );
  }

  void _stateListener(BuildContext context, LoginState state) {
    if (state.status == LoginStatus.codeRequested) {
      setState(() {
        isCodeRequested = true;
      });
    }
    else if (state.status == LoginStatus.successful){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MenuPage(),
        ),
      );
    }
  }
}
