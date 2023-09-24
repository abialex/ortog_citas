import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'ui/routes/app_pages.dart';
import 'ui/routes/app_routes.dart';
import 'ui/modules/splash/index.dart';
import 'ui/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final bool isDarkModeEnabled;
  MyApp(this.isDarkModeEnabled);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.changeThemeMode(isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light);
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // Agrega las localizaciones que desees usar
        const Locale('es', ''),
      ],
      locale: const Locale('es', ''), // Establece la localización deseada

      title: 'SLG Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      initialRoute: AppRoutes.SPLASH,
      initialBinding: SplashBinding(),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    );
  }
}
