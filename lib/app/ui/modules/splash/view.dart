import '../../../core/utils/style_utils.dart';
import 'index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  //controller ya está instanciado con sus métodos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                constraints: BoxConstraints.expand(
                    width: StyleUtils.MAX_WIDTH_IMAG_400,
                    height: StyleUtils.MAX_HEIGHT_IMAG_300),
                child: Image.asset("assets/imag_intro.jpg")),
          ],
        ),
      ),
    );
  }
}
