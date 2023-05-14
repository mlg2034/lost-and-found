import 'package:flutter/material.dart';
import 'package:tamyrlan/pages/create_page.dart';
import 'package:tamyrlan/pages/profile_page.dart';

import 'home_page.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 59),
                  child: SizedBox(
                    height: 222,
                    width: 414,
                    child: Image.asset('assets/images/AirPods.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 299, horizontal: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Airpods Pro Lost',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Bitter'),
                          ),
                          Text(
                            '24.05.2023',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Inter',
                                color: Color.fromRGBO(0, 0, 0, 0.7)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Color.fromRGBO(100, 93, 215, 1),
                        thickness: 2.0,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'D e s c r i p t i o n',
                          style: TextStyle(
                              fontFamily: 'Bitter',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Lost Airpods Pro version with a case and one earphone inside, on the territory of EXPO.',
                        style: TextStyle(
                            fontFamily: 'Bitter',
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      const SizedBox(
                        height: 91,
                      ),
                      const Divider(
                        color: Color.fromRGBO(100, 93, 215, 1),
                        thickness: 2.0,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Location',
                          style: TextStyle(
                              fontFamily: 'Bitter',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15),
                                child: Image.asset('assets/images/pin.png'),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Astana',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 76,
                            width: 312,
                            child: Image.asset('assets/images/carta.png'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Color.fromRGBO(100, 93, 215, 1),
                        thickness: 2.0,
                      ),
                      const Text(
                        'USER',
                        style: TextStyle(
                            fontFamily: 'Bitter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    const  Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 43.5,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                           SizedBox(
                            width: 29,
                          ),
                          Column(
                            children: [
                              Text(
                                'Sharipova Amina',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Bitter',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 65, horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: SizedBox(
                        height: 87,
                        width: 87,
                        child: Image.asset('assets/images/go_back.png')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
