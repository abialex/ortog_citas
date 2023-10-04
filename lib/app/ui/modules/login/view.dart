import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/style_utils.dart';
import '../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../theme/app_colors.dart';
import 'controller.dart';
import 'widgets/custom_button.dart';
import 'widgets/widgets.dart';

class LoginPage extends GetWidget<LoginController> {
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        backgroundColor: OrtognaticaColors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT),
                  constraints: const BoxConstraints.expand(
                      width: StyleUtils.MAX_WIDTH_SCREEN),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                            constraints: BoxConstraints.expand(
                                width: StyleUtils.MAX_WIDTH_IMAG_400,
                                height: StyleUtils.MAX_HEIGHT_IMAG_150),
                            child: Image.asset("assets/logo.png")),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomTextFieldLogin(
                            controller: _.usernameText,
                            hintText: "username ejm: slg_01",
                            obscureText: false),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldLogin(
                            controller: _.passwordText,
                            hintText: "password",
                            obscureText: _.oculto.value,
                            suffixIcon: IconButton(
                              onPressed: _.setOculto,
                              icon: Icon(
                                _.oculto.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: Colors.grey,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            "",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomButtonLogin(
                          onTap: _.loguear,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Obx(() {
                  if (controller.loginIconState.value ==
                      ProgressState.visible) {
                    return Container(
                      color: Colors.black26,
                      child: const Center(
                        child: CustomProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Version: ${_.version}",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              Text(
                "Ult. actualización: ${_.lastUpdate}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
