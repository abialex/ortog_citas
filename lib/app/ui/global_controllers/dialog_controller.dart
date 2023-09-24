import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global_widgets/buttons/custom_button_submit.dart';
import '../theme/app_colors.dart';

class DialogController extends GetxController {
  RxInt countSeconds = 0.obs;
  Timer? timer;

  void showDialog001({
    required String title,
    required String mensaje,
    Function()? onTapLeft,
    Function()? onTapRight,
    bool withTime = false,
    bool twoOptions = true,
    int seconds = 2,
    IconData icon = Icons.logout,
  }) {
    countSeconds.value = seconds;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: withTime ? 270 : 250,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            mensaje,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      visible: withTime,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Obx(
                              () => Text(
                                "(${countSeconds})",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Visibility(
                          visible: twoOptions,
                          child: Expanded(
                            child: CustomButtonSubmit(
                                onTap: () {
                                  if (onTapLeft != null) onTapLeft();
                                  Get.back();
                                },
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                paggingInsetsVerticalTextValue: 15,
                                paggingInsetsButtonValue: 5,
                                color: SlgColors.lightGrey,
                                text: "CANCELAR"),
                          ),
                        ),
                        Expanded(
                          child: CustomButtonSubmit(
                              onTap: () {
                                if (onTapRight != null) onTapRight();
                                Get.back();
                              },
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              paggingInsetsVerticalTextValue: 15,
                              paggingInsetsButtonValue: 5,
                              text: "ACEPTAR"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -45,
              child: CircleAvatar(
                backgroundColor: SlgColors.azul_principal,
                radius: 45,
                child: Icon(
                  icon,
                  size: 45,
                  color: SlgColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ).then((value) => closeTimer());
    if (withTime) startTimer(seconds);
  }

  void showDialog002({
    required String title,
    required String mensaje,
    Function()? onTapLeft,
    Function()? onTapRight,
    bool withTime = false,
    bool twoOptions = true,
    int seconds = 2,
    IconData icon = Icons.logout,
  }) {
    countSeconds.value = seconds;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: withTime ? 430 : 400,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  mensaje,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            visible: withTime,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      "(${countSeconds})",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: twoOptions,
                          child: Expanded(
                            child: CustomButtonSubmit(
                                onTap: () {
                                  if (onTapLeft != null) onTapLeft();
                                  Get.back();
                                },
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                paggingInsetsButtonValue: 5,
                                color: SlgColors.lightGrey,
                                text: "CANCELAR"),
                          ),
                        ),
                        Expanded(
                          child: CustomButtonSubmit(
                              onTap: () {
                                if (onTapRight != null) onTapRight();
                                Get.back();
                              },
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              paggingInsetsButtonValue: 5,
                              text: "ACEPTAR"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -45,
              child: CircleAvatar(
                backgroundColor: SlgColors.azul_principal,
                radius: 45,
                child: Icon(
                  icon,
                  size: 45,
                  color: SlgColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ).then((value) => closeTimer());
    if (withTime) startTimer(seconds);
  }

  void startTimer(seconds) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds == 1) {
        timer.cancel();
        Get.back();
      } else {
        //second>0 pero cada 1
        seconds--;
        countSeconds.value = seconds;
      }
    });
  }

  void closeTimer() {
    timer?.cancel();
  }
}
