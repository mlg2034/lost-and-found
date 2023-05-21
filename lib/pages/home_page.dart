import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                 SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 18.h,
                  width: 118.w,
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
                 SizedBox(
                  height: 28.h,
                ),
                Container(
                  height: 236.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 115.h,
                          width: 180.w,
                          child: InkWell(
                              onTap: ()async {
                              await  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductView()));
                              },
                              child: Image.asset('assets/images/AirPods.png'))),
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           const Text(
                              'Airpods Pro Lost',
                              style: TextStyle(
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                
                                    'Lost Airpods Pro version with a case and one earphone inside, on the territory of EXPO.',
                                    style: TextStyle(
                                        fontFamily: 'Bitter',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
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
