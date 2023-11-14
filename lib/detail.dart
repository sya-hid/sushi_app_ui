import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sushi_app/const.dart';
import 'package:sushi_app/widgets/additional_item.dart';
import 'package:sushi_app/widgets/lampion_light.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> additionalItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: white.withOpacity(.05), shape: BoxShape.circle),
              child: Icon(
                Icons.more_vert,
                color: white.withOpacity(.5),
              )),
          const SizedBox(width: 30)
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: LampionLight(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    white.withOpacity(.15),
                    background.withOpacity(.1)
                  ])),
            ),
          ),
          Positioned(
            top: -50,
            child: Image.asset(
              'assets/lampion.png',
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: white.withOpacity(.05),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.favorite_outline_rounded,
                            color: white.withOpacity(.5),
                          )),
                    ),
                    Text(
                      'Sushi Salmon',
                      style: poppins.copyWith(
                        color: white,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'TO ENJOY',
                      style: poppins.copyWith(
                          fontSize: 18, color: white.withOpacity(.5)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'A typical Japanese dish, easy to prepare and ideal for a very special dinner.',
                      style: poppins.copyWith(
                          color: white.withOpacity(.5), fontSize: 14),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 225,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -50,
                      child: Image.asset('assets/sushi_salmon.png', width: 350),
                    ),
                    Positioned(
                      top: 180,
                      right: -50,
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                background.withOpacity(.85),
                                background.withOpacity(.9),
                                background
                              ],
                              stops: const [
                                .125,
                                .4,
                                .6
                              ]).createShader(rect);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Transform.flip(
                          flipY: true,
                          child: Image.asset(
                            'assets/sushi_salmon.png',
                            width: 350,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: 50,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.remove),
                            const SizedBox(width: 10),
                            Text(
                              '3',
                              style: poppins.copyWith(fontSize: 18),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.add),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Additional',
                  style: poppins.copyWith(
                      color: white, fontWeight: FontWeight.w100, fontSize: 24),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: PageView.builder(
                  itemCount: additional.length,
                  controller: PageController(viewportFraction: .6),
                  padEnds: false,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 30, right: 5)
                          : const EdgeInsets.only(left: 5, right: 30),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (additionalItems
                                .contains(additional[index]['name'])) {
                              additionalItems.remove(additional[index]['name']);
                            } else {
                              additionalItems.add(additional[index]['name']!);
                            }
                          });
                        },
                        child: AdditionalItem(
                          image: '${additional[index]['image']}',
                          name: '${additional[index]['name']}',
                          selected: additionalItems
                              .contains(additional[index]['name']),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$36',
                          style: poppins.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              color: white),
                        ),
                        Text(
                          '.99',
                          style: poppins.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: white.withOpacity(.05),
                                shape: BoxShape.circle),
                            child: Icon(
                              CupertinoIcons.share_up,
                              size: 28,
                              color: white.withOpacity(.5),
                            )),
                        const SizedBox(width: 20),
                        Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: orange, shape: BoxShape.circle),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: 26,
                              color: white.withOpacity(.5),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
