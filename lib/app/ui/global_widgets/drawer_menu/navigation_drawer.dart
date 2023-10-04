import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_controllers/dialog_controller.dart';
import '../../global_controllers/theme_controller.dart';
import '../../theme/app_colors.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (_) => Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                child: Text(
                    _.user?.roles.isNotEmpty ?? false
                        ? _.user!.roles[0].nombreRol
                        : "Sin Rol",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: CircleAvatar(
                    backgroundColor: OrtogColors.ortog_color,
                    child: Text(
                      (_.user?.persona ?? "NN").substring(0, 2),
                      style: TextStyle(fontSize: 50, color: OrtogColors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, i) =>
                          const Divider(color: OrtogColors.ortog_color),
                      itemCount: _.listRutes.length,
                      itemBuilder: (context, i) {
                        bool isPageSelected =
                            Get.currentRoute == _.listRutes[i].routePage;
                        return ListTile(
                          selectedTileColor: OrtogColors.grey,
                          selected: isPageSelected,
                          selectedColor: OrtogColors.white,
                          leading: Icon(_.listRutes[i].icon,
                              color: OrtogColors.ortog_color),
                          title: Text(_.listRutes[i].titulo),
                          trailing: const Icon(Icons.chevron_right,
                              color: OrtogColors.ortog_color),
                          onTap: () {
                            if (isPageSelected) {
                              Get.back();
                            } else {
                              Get.toNamed(_.listRutes[i].routePage);
                            }
                          },
                        );
                      }),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.sunny,
                  color: OrtogColors.ortog_color,
                ),
                title: const Text('Modo Oscuro'),
                trailing: Obx(() => Switch.adaptive(
                      value: _.isThemeDark,
                      activeColor: OrtogColors.ortog_color,
                      onChanged: (value) => _.changeTheme(),
                    )),
              ),
              ListTile(
                leading:
                    const Icon(Icons.logout, color: OrtogColors.ortog_color),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  DialogController().showDialog001(
                    title: "Sesión",
                    mensaje: "¿Desea cerrar sesión?",
                    seconds: 5,
                    withTime: true,
                    onTapRight: _.logout,
                  );
                },
                // trailing: Text("s"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
