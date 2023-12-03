import "package:drive_demo/firebase_options.dart";
import "package:drive_demo/utils/app_routes.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseOptions options = DefaultFirebaseOptions.currentPlatform;
  await Firebase.initializeApp(options: options);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Drive Demo",
      navigatorKey: Get.key,
      theme: getThemeData(brightness: Brightness.light),
      darkTheme: getThemeData(brightness: Brightness.light),
      initialRoute: getInitialRoute(),
      initialBinding: getInitialBinding(),
      getPages: AppRoutes.instance.getPages,
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData getThemeData({required Brightness brightness}) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorSchemeSeed: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      applyElevationOverlayColor: true,
    );
    return themeData;
  }

  String getInitialRoute() {
    return AppRoutes.instance.initialRoute;
  }

  Bindings getInitialBinding() {
    return AppRoutes.instance.initialBinding;
  }
}
