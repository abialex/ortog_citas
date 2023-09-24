import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomHeader extends StatelessWidget {
  final double margenBottom;
  final double paddingTop;
  final double height;
  final Color backgroundColor;
  final Widget title;

  const CustomHeader({
    Key? key,
    this.paddingTop = 25,
    this.margenBottom = 1,
    this.height = 70,
    required this.backgroundColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // color de la barra de estado
      // statusBarBrightness: Brightness.dark, // brillo del texto de la barra de estado
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.light, // brillo de los iconos de la barra de estado
      // systemNavigationBarColor:
      //     Colors.transparent, // color de la barra de navegación (botones)
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    ));

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      margin: EdgeInsets.only(bottom: margenBottom),
      padding: EdgeInsets.only(top: paddingTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          title,
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }

  // @override
  // Size get preferredSize => Size.fromHeight(height);
}
