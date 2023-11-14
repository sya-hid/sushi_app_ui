import 'package:flutter/material.dart';
import 'package:sushi_app/const.dart';

class AdditionalItem extends StatelessWidget {
  final String image, name;
  final bool selected;
  const AdditionalItem({
    super.key,
    required this.image,
    required this.name,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: background2),
          child: Row(
            children: [
              Image.asset(
                'assets/$image',
                width: 60,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  name,
                  style: poppins.copyWith(
                      fontSize: 14, color: white.withOpacity(.5)),
                ),
              )
            ],
          ),
        ),
        selected
            ? const Positioned(
                right: -10,
                top: -20,
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.lightGreen,
                  size: 32,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
