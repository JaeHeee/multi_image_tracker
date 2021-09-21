import 'package:flutter/material.dart';

class RectClipper extends CustomClipper<Path> {
  final int trackingIndex;
  final double initClipFactor;
  final double clipFactor;

  double? _clipFactorValue;

  RectClipper({
    required this.initClipFactor,
    required this.clipFactor,
    required this.trackingIndex,
  });

  @override
  Path getClip(Size size) {
    if (trackingIndex == 0) {
      if (clipFactor >= 1.0) {
        _clipFactorValue = clipFactor - (1 - initClipFactor);
      } else if (clipFactor == initClipFactor) {
        _clipFactorValue = initClipFactor;
      } else {
        _clipFactorValue = clipFactor - (1 - initClipFactor);
      }
    } else {
      if (clipFactor == initClipFactor) {
        _clipFactorValue = 1.0;
      } else {
        _clipFactorValue =
            clipFactor + initClipFactor * (trackingIndex + 1) - 1;
      }
    }

    final path = Path();
    path.lineTo(size.width * _clipFactorValue!, 0.0);
    path.lineTo(size.width * _clipFactorValue!, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
