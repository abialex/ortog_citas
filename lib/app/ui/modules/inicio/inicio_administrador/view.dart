import 'package:firebase_database/firebase_database.dart';
import '../../../global_widgets/animation/image_bubble.dart';
import '../../../global_widgets/animation/text_bubble.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum PageEnum {
  inicio("Administrador");

  const PageEnum(this.nombre);
  final String nombre;
}

class InicioAdministradorPage extends GetWidget<InicioAdministradorController> {
  //controller ya está instanciado con sus métodos

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InicioAdministradorController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(PageEnum.inicio.nombre),
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
                  ImageBubble(
                    image: Image.asset(
                      'assets/slg/slg_logo_login.png',
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 100,
                    ),
                  )
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
    return Container(
      height: 300,
      child: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref().child(child).onValue,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            DataSnapshot dataSnapshot = snapshot.data!.snapshot;
            Map<dynamic, dynamic>? dataMap =
                dataSnapshot.value as Map<dynamic, dynamic>?;

            if (dataMap != null) {
              List<Widget> widgets = dataMap.entries.map<Widget>((entry) {
                String key = entry.key.toString();
                Map<dynamic, dynamic> value =
                    entry.value as Map<dynamic, dynamic>;
                return Text(value['campo2']);
                // Otros elementos de UI que desees mostrar
              }).toList();

              return ListView.builder(
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return widgets[index];
                },
              );
            } else {
              return Text('No se encontraron datos en la ruta especificada.');
            }
          } else if (snapshot.hasError) {
            return Text('Error al obtener los datos: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
