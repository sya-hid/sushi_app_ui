import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sushi_app/const.dart';
import 'package:sushi_app/detail.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    left: -40,
                    right: -40,
                    top: 100,
                    child: Image.asset('assets/sushi_plate.png')),
                Positioned(
                  top: 0,
                  right: 30,
                  child: Text(
                    'ボゴタ',
                    style: poppins.copyWith(
                        fontSize: 52, color: white.withOpacity(.1)),
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: -60,
                    child: Transform.rotate(
                      angle: pi * 30 / 180,
                      child: Image.asset(
                        'assets/chopstick.png',
                        height: 300,
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sushi',
                  style: poppins.copyWith(
                    fontSize: 48,
                    color: orange,
                  ),
                ),
                Text(
                  'Ideal to share',
                  style: poppins.copyWith(
                      color: white, fontSize: 26, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 10),
                Text(
                  'Sushi is a typical dish of Japanese origin based on seasoned rice.',
                  style: poppins.copyWith(
                      fontSize: 16, color: white.withOpacity(.5)),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Row(
                      children: [
                        ...List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                    height: 5,
                                    width: index == 0 ? 20 : 5,
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? Colors.lightGreen
                                            : white,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ))
                      ],
                    ),
                    const SizedBox(width: 120),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailPage()));
                        },
                        child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                'Next',
                                style: poppins.copyWith(
                                    fontSize: 16, color: white),
                              ),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
