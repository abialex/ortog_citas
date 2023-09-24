import 'index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  //controller ya está instanciado con sus métodos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("assets/imag_intro.jpg")),
          ],
        ),
      ),
    );
  }
}
