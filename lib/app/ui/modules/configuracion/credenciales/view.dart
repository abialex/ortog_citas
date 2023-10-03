import '../../../global_widgets/animation/text_bubble.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CredencialesPage extends GetWidget<CredencialesController> {
  //controller ya está instanciado con sus métodos
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CredencialesController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Credenciales"),
            backgroundColor: SlgColors.azul_principal),
        drawer: MenuPrincipal(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextBubble(
                    text: _.titulo.value,
                    fontsize: 24,
                  ),
                  SizedBox(height: 16),
                  TextBubble(
                    text: _.mensaje.value,
                    fontsize: 18,
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class MyWidget extends StatelessWidget {
  final String child;
  const MyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, child: Text("sdsd"));
  }
}
