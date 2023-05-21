import 'package:flutter/material.dart';

class PostsViewPage extends StatelessWidget {
  const PostsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(100, 93, 215, 1),
          centerTitle: true,
          title: Text(
            'Your Posts',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 24 / 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(
                  height: 37,
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(135, 131, 131, 1),
                      borderRadius: BorderRadius.circular(9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Airpods Pro lost',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 19.2 - 16),
                          ),
                          Text(
                            '24.05.2021',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.7),
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                height: 12 / 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 239,
                        child: Text(
                          'Lost Airpods Pro version with a case and one earphone inside, on the territory of EXPO.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            height: 14.4 / 12,
                            color: Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 21,),
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(135, 131, 131, 1),
                      borderRadius: BorderRadius.circular(9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Airpods Pro lost',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 19.2 - 16),
                          ),
                          Text(
                            '24.05.2021',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.7),
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                height: 12 / 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 239,
                        child: Text(
                          'Lost Airpods Pro version with a case and one earphone inside, on the territory of EXPO.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            height: 14.4 / 12,
                            color: Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
