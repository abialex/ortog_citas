import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/utils/style_utils.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final int seconds;
  final int miliseconds;
  final double height;
  ImageCarousel({
    required this.imageUrls,
    this.seconds = 5,
    this.height = 100,
    this.miliseconds = 0,
  });
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIndex = 0;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: StyleUtils.CUSTOM_PADDING_FORM_5_DEFAULT),
        alignment: Alignment.topCenter,
        height: widget.height,
        child: Image.asset(
          widget.imageUrls[currentIndex],
          key: ValueKey<String>(widget.imageUrls[currentIndex]),
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startImageRotation();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel(); // Cancelar el temporizador en dispose()
  }

  void startImageRotation() {
    _timer = Timer.periodic(
        Duration(seconds: widget.seconds, milliseconds: widget.miliseconds),
        (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.imageUrls.length;
      });
    });
  }
}
