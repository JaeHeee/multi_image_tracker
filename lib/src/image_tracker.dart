import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'rect_clipper.dart';

class MultiImageTracker extends StatefulWidget {
  const MultiImageTracker({
    Key? key,
    required this.images,
    required this.width,
    required this.height,
    this.clipFactor = 1.0,
    this.reverse = false,
  })  : assert(images.length * clipFactor >= 1),
        super(key: key);

  final List<Image> images;
  final double width;
  final double height;
  final double clipFactor;
  final bool reverse;

  @override
  State<MultiImageTracker> createState() => _MultiImageTrackerState();
}

class _MultiImageTrackerState extends State<MultiImageTracker> {
  late ScrollController _scrollController;
  late double _calculatedClipFactor = widget.clipFactor;
  late List<Image> _images = widget.images;

  @override
  void initState() {
    if (widget.reverse) {
      _images = widget.images.reversed.toList();
    }
    _scrollController = ScrollController()
      ..addListener(() => calculateClipFactor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: _imageContainers,
        fit: StackFit.expand,
      ),
    );
  }

  void get calculateClipFactor {
    setState(() {
      _calculatedClipFactor = -_scrollController.offset / widget.width + 1;
    });
  }

  List<Widget> get _imageContainers {
    final imageContainers = <Widget>[];

    for (var i = 0; i < _images.length; i++) {
      final trackingIndex = _images.length - i - 1;
      final isLatestImage = trackingIndex == _images.length - 1;

      imageContainers.add(
        isLatestImage
            ? _images[i]
            : ClipPath(
                clipper: RectClipper(
                  initClipFactor: widget.clipFactor,
                  clipFactor: _calculatedClipFactor,
                  trackingIndex: trackingIndex,
                ),
                child: _images[i],
              ),
      );
    }

    imageContainers.add(
      _SliderController(
        controller: _scrollController,
        length: _images.length,
        width: widget.width,
        clipFactor: widget.clipFactor,
      ),
    );
    return imageContainers;
  }
}

class _SliderController extends StatelessWidget {
  _SliderController({
    Key? key,
    required this.controller,
    required this.length,
    required this.width,
    required this.clipFactor,
  }) : super(key: key);

  final ScrollController controller;
  final int length;
  final double width;
  final double clipFactor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: controller,
      itemCount: length,
      itemBuilder: (context, index) {
        return Container(
          width: length == 1
              ? width
              : length * clipFactor == 1
                  ? width * (clipFactor + 1e-6)
                  : width * clipFactor,
          decoration: index == 0
              ? BoxDecoration(
                  color: Colors.white.withOpacity(0),
                )
              : _boxBorderDecoration,
        );
      },
    );
  }

  BoxDecoration get _boxBorderDecoration => const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.white),
        ),
      );
}
