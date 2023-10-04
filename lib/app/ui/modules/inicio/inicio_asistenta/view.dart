import 'package:ortog_citas/app/core/utils/style_utils.dart';
import 'package:ortog_citas/app/ui/global_widgets/animation/image_bubble.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../global_widgets/animation/image_swicht.dart';
import '../../../global_widgets/animation/text_bubble.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum PageEnum {
  inicio("Inicio");

  const PageEnum(this.nombre);
  final String nombre;
}

class InicioAsistentaPage extends GetWidget<InicioAsistentaController> {
  //controller ya está instanciado con sus métodos

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InicioAsistentaController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(PageEnum.inicio.nombre),
            backgroundColor: OrtogColors.ortog_color),
        drawer: MenuPrincipal(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextBubble(
                  text: "Bienvenido a la App de Citas",
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16),
                TextBubble(
                  text: "Ortognática",
                  fontsize: 16,
                ),
                // SizedBox(height: 16),
                // TextBubble(
                //   text: "1. Agrega una cita",
                //   fontsize: 15,
                //   alignment: TextAlign.left,
                // ),
                // ImageBubble(
                //   image: Image.asset(
                //     'assets/slg/instrucciones/agregar_cita.png',
                //     alignment: Alignment.center,
                //     width: double.infinity,
                //     height: 100,
                //   ),
                // ),
                // SizedBox(height: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT),
                // TextBubble(
                //   text: "2. Describe el motivo por el cual está ocupado",
                //   fontsize: 15,
                //   alignment: TextAlign.left,
                // ),
                // ImageCarousel(
                //   seconds: 2,
                //   height: 70,
                //   imageUrls: [
                //     'assets/slg/instrucciones/agregar_cita_ocupada.png',
                //     'assets/slg/instrucciones/cita_ocupado_perzonalizado.png'

                //     // Agrega aquí más URL de imágenes
                //   ],
                // ),
                // SizedBox(height: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT),
                // TextBubble(
                //   text: "3. Tipos de cita",
                //   fontsize: 15,
                //   alignment: TextAlign.left,
                // ),
                // ImageCarousel(
                //   height: 260,
                //   seconds: 5,
                //   imageUrls: [
                //     'assets/slg/instrucciones/cita_normal_add.png',
                //     'assets/slg/instrucciones/cita_rapida_add.png',
                //     'assets/slg/instrucciones/cita_ocupada_add.png',

                //     // Agrega aquí más URL de imágenes
                //   ],
                // ),
                // TextBubble(
                //   text:
                //       "CITA OCUPADA: Puedes describir el motivo por el cual está Ocupado. ",
                //   fontsize: 12,
                //   alignment: TextAlign.left,
                // ),
                // TextBubble(
                //   text:
                //       "Cita NORMAL: El paciente debe estar registrado en el sistema para ser buscado por su DNI.",
                //   fontsize: 12,
                //   alignment: TextAlign.left,
                // ),
                // TextBubble(
                //   text:
                //       "Cita RÁPIDA: Solo es necesario los nombres y el motivo.",
                //   fontsize: 12,
                //   alignment: TextAlign.left,
                // ),
                // SizedBox(height: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT),
                // TextBubble(
                //   text: "4. LLamadas",
                //   fontsize: 15,
                //   alignment: TextAlign.left,
                // ),
                // TextBubble(
                //   text:
                //       "Puedes llamar al paciente siempre y encuando hayas registrado su celular",
                //   fontsize: 12,
                //   alignment: TextAlign.left,
                // ),
                // ImageCarousel(
                //   height: 120,
                //   seconds: 2,
                //   imageUrls: [
                //     'assets/slg/instrucciones/llamada_off.png',
                //     'assets/slg/instrucciones/llamada_on.png',
                //     // Agrega aquí más URL de imágenes
                //   ],
                // ),
                // SizedBox(height: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT),
                // TextBubble(
                //   text: "5. Buscador de DNI",
                //   fontsize: 15,
                //   alignment: TextAlign.left,
                // ),
                // TextBubble(
                //   text: "Busca los datos de una persona por su DNI",
                //   fontsize: 12,
                //   alignment: TextAlign.left,
                // ),
                // ImageCarousel(
                //   height: 400,
                //   seconds: 0,
                //   miliseconds: 400,
                //   imageUrls: [
                //     'assets/slg/novedades/buscador_1.png',
                //     'assets/slg/novedades/buscador_2.png',
                //     'assets/slg/novedades/buscador_3.png',
                //     'assets/slg/novedades/buscador_4.png',
                //     'assets/slg/novedades/buscador_5.png',
                //     'assets/slg/novedades/buscador_6.png',
                //     'assets/slg/novedades/buscador_7.png',
                //     'assets/slg/novedades/buscador_8.png',
                //     'assets/slg/novedades/buscador_9_result.png',
                //     'assets/slg/novedades/buscador_9_result.png',
                //     'assets/slg/novedades/buscador_9_result.png',
                //     'assets/slg/novedades/buscador_9_result.png',

                //     // Agrega aquí más URL de imágenes
                //   ],
                // ),
                // SizedBox(height: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT),
                // TextBubble(
                //   text: "6. Actualiza las citas rápidas",
                //   fontsize: 15,
                //   alignment: TextAlign.left,
                // ),
                // TextBubble(
                //   text:
                //       "Puedes crear un paciente desde la cita rápida que registraste",
                //   fontsize: 12,
                //   alignment: TextAlign.left,
                // ),
                // ImageBubble(
                //   image: Image.asset(
                //     'assets/slg/instrucciones/actualizar_paciente_desde_cita.png',
                //     alignment: Alignment.center,
                //     width: double.infinity,
                //     height: 400,
                //   ),
                // ),
              ],
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
