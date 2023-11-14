import 'package:flutter/material.dart';

class LampionLight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var lightWidth = 100;
    var path = Path();
    path.lineTo(size.width * .5 - lightWidth * .5, 0);
    path.lineTo(-50, size.height);
    path.lineTo(size.width + 50, size.height);
    path.lineTo(size.width * .5 + lightWidth * .5, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
