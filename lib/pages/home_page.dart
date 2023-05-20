import 'package:flutter/material.dart';
import 'package:tamyrlan/pages/profile_page.dart';

import '../widgets/text_field_widget/custom_search_text_fied.dart';
import 'product_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedContainer(
        duration:const Duration(microseconds: 100),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 63),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap:(){
                    setState(() {
                      _isFocused = true;
                    });
                  } ,
                  child: CustomSearchTextField(textHint: 'S e a r c h . . .',)),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 18,
                  width: 118,
                  child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                              color: Color.fromRGBO(100, 93, 215, 1)),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Astana',
                        style: TextStyle(
                            color: const Color.fromRGBO(100, 93, 215, 1),
                            fontSize: 12,
                            fontFamily: 'Bitter',
                            fontWeight: FontWeight.w400),
                      )),
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  height: 236,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 115,
                          width: 180,
                          child: InkWell(
                              onTap: ()async {
                              await  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductView()));
                              },
                              child: Image.asset('assets/images/AirPods.png'))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Airpods Pro Lost',
                              style: TextStyle(
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Lost Airpods Pro version with a case and one earphone inside, on the territory of EXPO.',
                              style: TextStyle(
                                  fontFamily: 'Bitter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '24.05.2034',
                                style: TextStyle(
                                    fontFamily: 'Bitter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(135, 131, 131, 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]
      
        );
  }
}
